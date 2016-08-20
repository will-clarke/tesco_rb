require 'test_helper'

class ItemRequesterTest < Minitest::Test
  attr_reader :client

  def setup
    @client = ::TescoRb::Client.new(ENV['TESCO_API_KEY'])
  end

  def test_item_with_no_arguments
    response = client.item(query: 'bananas', offset: 0, limit: 1)
    assert_kind_of Array, response
    assert_kind_of TescoRb::Item, response.first
  end

  def test_item_with_limit
    assert_equal client.item(query: 'bananas', limit: 5).count, 5
  end

  def test_item_offset
    banana_1 = client.item(query: 'bananas', offset: 1, limit: 1).last
    banana_2 = client.item(query: 'bananas', offset: 0, limit: 2).last
    assert_equal banana_1, banana_2
  end

end
