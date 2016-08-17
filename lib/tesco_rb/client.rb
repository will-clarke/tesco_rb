require "tesco_rb/store_requester"
require 'httparty'

module TescoRb
  # The main class to coordinate HTTP requests
  class Client
    include HTTParty
    attr_reader :api_key

    base_uri 'https://dev.tescolabs.com/'

    def initialize(api_key)
      @api_key = api_key
    end

    def store(options = {})
      StoreRequester.create_representations(self, options)
    end

    def get(url, options = {})
      self.class.get(url, options.merge(default_options))
    end

    def default_options
      { headers:
          { 'Ocp-Apim-Subscription-Key' => ENV['TESCO_API_KEY'] } }
    end
  end
end
