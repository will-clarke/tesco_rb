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

module VcrPlugin
  def before_setup
    VCR.insert_cassette(to_s)
    super
  end

  def after_teardown
    VCR.eject_cassette
    super
  end
end

class MiniTest::Test
  include VcrPlugin
end
