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
    attribute :rrpp
    attribute :rrpd
    attribute :rrp
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
end
