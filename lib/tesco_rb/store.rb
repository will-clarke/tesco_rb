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

    def initialize(json_location)
      location = json_location['location']
      set self.fields, location
      address_json = location.fetch('contact').fetch('address')
      @address = Address.new(address_json)
    end

    def set_fields
      fields.each { |field| attr_reader field }
    end
  end
end
