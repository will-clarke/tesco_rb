require_relative 'representation_helper'
require_relative 'address'

module TescoRb
  class Item
    include RepresentationHelper

    def self.fields
      %I( image tpnb PromotionDescription
          ContentsMeasureType name UnitOfSale
          AverageSellingUnitWeight UnitQuantity
          ContentsQuantity price unitprice)
    end

    attr_reader(*fields)

    def initialize(location)
      set self.class.fields, location
    end

    def ==(other)
      self.class.fields.all? do |method_name|
        send(method_name) == other.send(method_name)
      end
    end

  end
end
