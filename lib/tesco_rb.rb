require_relative 'tesco_rb/version'
require_relative 'tesco_rb/client'
# require_relative 'tesco_rb/store'
# require_relative 'tesco_rb/store_requester'
# require_relative 'tesco_rb/representation_helper'

# The entry point to this gem: TescoRb.new(API_KEY)
module TescoRb
  def self.new(api_key)
    Client.new(api_key)
  end
end
