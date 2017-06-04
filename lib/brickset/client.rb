module Brickset
  class Client
    def get_set(legoset_id)
      Services::GetLegoset.new(legoset_id).run
    end
  end
end
