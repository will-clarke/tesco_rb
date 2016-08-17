module TescoRb
  class Address
    include RepresentationHelper
    attr_reader :lines, :town, :postcode
    def initialize(hash)
      set [:lines, :town, :postcode], hash
    end
  end
end
