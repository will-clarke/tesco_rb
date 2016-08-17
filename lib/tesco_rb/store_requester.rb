require_relative 'store'

module TescoRb
  class StoreRequester

    def self.create_representations(client, hash_args)
      response = request(client, hash_args)
      json_response = parse_json(response)
      json_response['results'].map do |json_location|
        Store.new(json_location)
      end
    end

    def self.request(client, hash_args)
      client.get '/locations/search', query: hash_args
    rescue => e
      p e
    end

    def self.parse_json(request)
      begin
        JSON.parse(request.body)
      rescue Oj::ParseError => e
        p e
        { 'results' => [] }
      end
    end

  end

  class GeoCoordinates
  end

  class OpeningHours
  end

end
