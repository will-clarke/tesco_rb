require_relative 'representation_helper'
require_relative 'address'

module TescoRb
  class Item
    include RepresentationHelper

    def initialize(json)
      item = json.each.with_object({}) { |(k, v), hash| hash[underscore(k)] = v }
      create_attr_readers_for item.keys
      set item.keys, item
    end

    def ==(other)
      instance_variables.all? do |method_name|
        current_var = instance_variable_get method_name.to_sym
        other_var = other.instance_variable_get method_name.to_sym
        current_var == other_var
      end
    end

    private

    def create_attr_readers_for(keys)
      keys.map! { |i| underscore(i) }
      keys.each do |key|
        self.class.class_eval("def #{key};@#{key};end")
      end
    end

    # kind of nabbed from ActiveSupport
    def underscore(word)
      word.to_s.gsub(/::/, '/').
        gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_").
        downcase
    end

  end
end
