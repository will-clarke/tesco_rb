require_relative 'store_requester'
require_relative 'item_requester'
require 'httparty'

module TescoRb
  # The main class to coordinate HTTP requests
  class Client
    include HTTParty
    attr_reader :api_key

    base_uri 'https://dev.tescolabs.com/'

    def initialize(api_key)
      fail 'invalid API Key' unless api_key.is_a?(String) && api_key.length > 10
      @api_key = api_key
    end

    def store(options = {})
      StoreRequester.new.create_representations(self, options)
    end

    def item(options = {})
      ItemRequester.new.create_representations(self, options)
    end

    def get(url, options = {})
      self.class.get(url, options.merge(default_options))
    end

    def default_options
      { headers:
          { 'Ocp-Apim-Subscription-Key' => api_key } }
    end
  end
end
