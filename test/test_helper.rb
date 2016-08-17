$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'tesco_rb'
require 'pry'
require 'vcr'
# require 'webmock/minitest'
require 'minitest/autorun'

require 'dotenv'
Dotenv.load
# require 'minitest-vcr'
# MinitestVcr::Spec.configure!

VCR.configure do |config|
  config.cassette_library_dir = 'test/vcr_cassettes'
  config.default_cassette_options = { record: :new_episodes }
  config.hook_into :webmock
  ENV.each do |key, value|
    next unless key =~ /key|url|secret|password/i
    config.filter_sensitive_data(key) { value }
  end
end

# def wow
#   binding.pry
# end

# def name
#   # binding.pry
#   # p self.class.to_s
#   # p @NAME
#   # p '2'
#   # self.class.to_s + '___' + @NAME
#   # irb
#   # to_s.gsub('#', '___')
# end

# todo: monkey patch minitest or something to get this one working.
# ? monkey patch all minitest::test methods??


# https://github.com/seattlerb/minitest/blob/master/lib/minitest/test.rb

  # module MyMinitestPlugin
  #   def before_setup
  #     binding.pry
  #     file_name = to_s
  #     super
  #     # ... stuff to do before setup is run
  #   end

  #   def after_setup
  #     # ... stuff to do after setup is run
  #     super
  #   end

  #   def before_teardown
  #     super
  #     # ... stuff to do before teardown is run
  #   end

  #   def after_teardown
  #     # ... stuff to do after teardown is run
  #     binding.pry
  #     super
  #   end
  # end

  # class MiniTest::Test
  #   include MyMinitestPlugin
  # end


# https://gist.github.com/mattbrictson/72910465f36be8319cde
# Monkey patch the `test` DSL to enable VCR and configure a cassette named
# based on the test method. This means that a test written like this:
#
# class OrderTest < ActiveSupport::TestCase
#   test "user can place order" do
#     ...
#   end
# end
#
# will automatically use VCR to intercept and record/play back any external
# HTTP requests using `cassettes/order_test/_user_can_place_order.yml`.

# class ActiveSupport::TestCase
#   def self.test(test_name, &block)
#     return super if block.nil?

#     cassette = [name, test_name].map do |str|
#       str.underscore.gsub(/[^A-Z]+/i, '_')
#     end.join('/')

#     super(test_name) do
#       VCR.use_cassette(cassette) do
#         instance_eval(&block)
#       end
#     end
#   end
# end
