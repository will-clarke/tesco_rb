require 'test_helper'

class StoreLocationTest < Minitest::Test

  def setup
    @client = ::TescoRb::Client.new(ENV['TESCO_API_KEY'])
  end

  def test_store
    # VCR.use_cassette(to_s + rand(100000).to_s) do
    VCR.use_cassette(to_s + 2.to_s) do
      assert_kind_of Array, @client.store
      binding.pry
      assert_kind_of Store, @client.store.first
      assert @client.store(offset: 0)
      assert @client.store(limit: 10)
      assert @client.store(near: 'SW5 4YY')
      assert @client.store(filter: 'isoCountryCode:GB AND category:Store AND facilities:DBT')
      assert @client.store(like: 'like=name:^Ba')
      assert @client.store(near: 'SW5 4YY', limit: 30)
    end
  end

end
