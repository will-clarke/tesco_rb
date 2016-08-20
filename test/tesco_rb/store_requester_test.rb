require 'test_helper'

class StoreRequesterTest < Minitest::Test
  attr_reader :client

  def setup
    @client = ::TescoRb::Client.new(ENV['TESCO_API_KEY'])
  end

  def test_store_with_no_arguments
    assert_kind_of Array, client.store
    assert_kind_of TescoRb::Store, client.store.first
  end

  def test_store_with_limit
    assert_equal client.store(limit: 1).count, 1
    assert_equal client.store(limit: 5).count, 5
  end

  def test_store_offset
    first_1 = client.store(limit: 1)
    first_2 = client.store(limit: 1, offset: 0)
    assert_equal first_1, first_2
    second_1 = client.store(limit: 2).last
    second_2 = client.store(limit: 1, offset: 1).first
    assert_equal second_1, second_2
  end

  def test_store_near
    assert client.store(near: 'SW5 4YY')
    assert client.store(filter: 'isoCountryCode:GB AND category:Store AND facilities:DBT')
    assert client.store(like: 'like=name:^UnlikelyName')
    assert client.store(near: 'SW5 4YY', limit: 30)
  end

end
