module Brickset
  class Legoset
    include ::Virtus.model

    attribute :legoset_id
    attribute :name
    attribute :theme
    attribute :subtheme
    attribute :year
    attribute :pieces
    attribute :minifigs
    attribute :rrp_gbp
    attribute :rrp_usd
    attribute :rrp_eur
    attribute :ppp
    attribute :score
    attribute :available_since
    attribute :eol

    def initialize(legoset_id)
      self.legoset_id = legoset_id
    end

    def url
      "https://brickset.com/sets/#{@legoset_id}-1"
    end
  end

  class Legoset::NotFound < StandardError; end
end
