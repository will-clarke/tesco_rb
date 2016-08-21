require_relative 'item'

# TODO: subclass these requesters as they share loads of logic.
module TescoRb
  class ItemRequester
    def create_representations(client, hash_args)
      response = request(client, update_args(hash_args))
      products = response['uk']['ghs']['products']['results']
      products.map do |json|
        Item.new(json)
      end
    end

    private

    def update_args(args)
      args[:offset] ||= 0
      args[:limit] ||= 1
      args
    end

    def request(client, hash_args)
      client.get '/grocery/products', query: hash_args
    end

  end

  class GeoCoordinates
  end

  class OpeningHours
  end

end
