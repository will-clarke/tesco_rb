require 'test_helper'

class ClientTest < Minitest::Test

  def setup
    @client = ::TescoRb::Client.new(ENV['TESCO_API_KEY'])
  end

  def test_initialize
    assert_raises(ArgumentError) { ::TescoRb::Client.new }
    assert @client
  end

  def test_default_options
    headers = @client.default_options[:headers]
    assert_equal headers['Ocp-Apim-Subscription-Key'], ENV['TESCO_API_KEY']
  end

  def test_it_can_get_an_actual_connection
    response = @client.get('/some_url')
    assert_kind_of String, response.body
    assert_equal response.code, 404
  end

end
