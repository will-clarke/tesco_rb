require_relative 'store'

module TescoRb
  class StoreRequester
    def create_representations(client, hash_args)
      response = request(client, update_args(hash_args))
      json_response = parse_json(response)
      return [] unless json_response.is_a?(Hash) &&
                       json_response['results']
      json_response['results'].map do |json|
        Store.new(json.fetch('location'))
      end
    end

    private

    def update_args(args)
      if args[:near]
        near_args = args.delete(:near)
        args[:sort] = "near:\"#{near_args}\""
      end
      args
    end

    def request(client, hash_args)
      client.get '/locations/search', query: hash_args
    rescue => e
      p e
    end

    def parse_json(request)
      JSON.parse(request.body)
    rescue JSON::ParserError => e
      p e
      { 'results' => [] }
    end

  end

  class GeoCoordinates
  end

  class OpeningHours
  end

end
