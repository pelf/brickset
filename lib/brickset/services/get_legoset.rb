module Brickset
  module Services
    class GetLegoset

      def initialize(legoset_id)
        @legoset_id = legoset_id
      end

      def run
        details = parse_details Web.parse(legoset.url)
        legoset.attributes = details
        legoset
      end

      private

      def legoset
        @legoset ||= Legoset.new(@legoset_id)
      end

      def parse_details(html)
        details = { }
        eol = 0

        featurebox = html.css('section.featurebox dl')
        raise Brickset::Legoset::NotFound unless featurebox.any?

        featurebox.css('dt,dd').to_a.each_slice(2) do |dt, dd|
          case dt.text.strip
          when 'Name'
            details[:name] = dd.text
          when 'Theme'
            details[:theme] = dd.text
          when 'Subtheme'
            details[:subtheme] = dd.text
          when 'Year released'
            details[:year] = dd.text.to_i
          when 'Pieces'
            details[:pieces] = dd.text.to_i
          when 'Minifigs'
            details[:minifigs] = dd.text.to_i
          when 'Weight'
            dd.text =~ /([\d|\.]+)Kg/
            details[:weight] = $1.to_f
          when 'RRP'
            rrps = dd.text.split('/').map{|p| p.match(/([\d|\.]+)/).to_s}
            details[:rrp_gbp] = rrps.first.to_f
            details[:rrp_usd] = rrps.second.to_f
            details[:rrp_eur] = rrps.third.to_f
          when 'Price per piece'
            dd.text =~ /([\d|\.]+)p\s+\/\s+([\d|\.]+)c/
            details[:ppp] = $1.to_f
          when 'Rating'
            dd.text =~ /[^\d]*([\d|\.]+) from/
            details[:score] = $1.to_f
          when 'United Kingdom'
            if dd.children.first.text =~ /(.+) - (.+)/
              details[:available_since] = Date.parse($1)
              if $2.strip != 'now'
                eol += 1
                details[:available_until] = Date.parse($2)
              end
            end
          when 'United States'
            eol += 1 unless dd.children.first.text =~ /now/
          when 'Canada'
            eol += 1 unless dd.children.first.text =~ /now/
          end
        end
        return details.merge({eol: eol})
      end
    end
  end
end
