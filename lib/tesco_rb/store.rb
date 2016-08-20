require_relative 'representation_helper'
require_relative 'address'

module TescoRb
  class Store
    include RepresentationHelper
    attr_reader :address

    def self.fields
      [:id, :name, :altIds, :region, :geo,
       :classification, :status, :facilities]
    end

    attr_reader(*fields)

    def initialize(location)
      set self.class.fields, location
      begin
        address_json = location.fetch('contact').
                       fetch('address')
        @address = Address.new(address_json)
      rescue KeyError => e
        p e
      end
    end

    def ==(other)
      self.class.fields.all? do |method_name|
        send(method_name) == other.send(method_name)
      end
    end

    def set_fields
      fields.each { |field| attr_reader field }
    end
  end
end
