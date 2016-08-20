require 'test_helper'

class ItemTest < Minitest::Test

  @client = ::TescoRb::Client.new(ENV['TESCO_API_KEY'])

  client.item.search('bananas')
  # -- same as:
  client.item(query: 'bananas')
  client.item(offset: 0, limit: 10, query: 'chives')

  assert_kind_of Array, client.store
  assert_kind_of TescoRb::Store, client.store.first

  assert_equal client.store(limit: 1).count, 1
  assert_equal client.store(limit: 5).count, 5
end