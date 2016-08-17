module TescoRb
  module RepresentationHelper
    def set(attributes, hash)
      Array.new(attributes).each do |attribute|
        instance_variable_set("@#{attribute}", hash[attribute.to_s])
      end
    end
  end
end
