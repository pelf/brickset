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
        # TODO: refactor / cleanup
        details = { }
        eol = 0
        html.css('section.featurebox dl').css('dt,dd').to_a.each_slice(2) do |dt, dd|
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
            details[:rrpp] = rrps.first.to_f
            details[:rrpd] = rrps.second.to_f
            if rrps.third.present?
              details[:rrp] = rrps.third.to_f
            else
              # we're converting price in dollars (almost) directly on purpose (in US sets tend to be cheaper)
              if details[:rrpp] and details[:rrpd] # use avg between dollars and bgp
                details[:rrp] = ((details[:rrpp] * 1.25)+(details[:rrpd] * 0.9))/2.0
              elsif details[:rrpp]
                details[:rrp] = (details[:rrpp] * 1.25)
              elsif details[:rrpd]
                details[:rrp] = (details[:rrpd] * 0.9)
              end
            end
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
