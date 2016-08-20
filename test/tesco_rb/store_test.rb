require 'test_helper'

class StoreTest < Minitest::Test
  attr_reader :store
  def test_initialization
    assert_raises(ArgumentError) { TescoRb::Store.new }
    hash = { 'name' => 'Awesome Name' }
    capture_stdout { @store = TescoRb::Store.new(hash) }
    assert_equal store.name, 'Awesome Name'
    assert_equal store.id, nil
  end

  def test_eq
    store_1, store_2 = nil
    capture_stdout do
      store_1 = TescoRb::Store.new({})
      store_2 = TescoRb::Store.new({})
    end
    assert_equal store_1, store_2
    capture_stdout do
      store_1 = TescoRb::Store.new('name' => 'Tesco')
      store_2 = TescoRb::Store.new('name' => 'Something Different')
    end
    refute_equal store_1, store_2
    capture_stdout do
      store_1 = TescoRb::Store.new('name' => 'Tesco')
      store_2 = TescoRb::Store.new('name' => 'Tesco')
    end
    assert_equal store_1, store_2
  end

  # {'id' => '8d72afa9-3f2e-4b23-9c6a-9f0d842833ab',
  #  'name' => 'Tesco Aylesford CFC',
  #  'altIds' => {'branchNumber' => 5998},
  #  'region' => {'isoCountryCode' => 'GB'},
  #  'contact' =>
  #  {'address' =>
  #   {'lines' =>
  #    [{'lineNumber' => 2, 'text' => 'Priory Park'},
  #     {'lineNumber' => 1, 'text' => 'Mills Road'}],
  #    'town' => 'Aylesford',
  #    'postcode' => 'ME20 7PP'}},
  #  'geo' => {'coordinates' => {'longitude' => 0.46399, 'latitude' => 51.289805}},
  #  'classification' => {'category' => 'CFC'},
  #  'status' => {'currentStatus' => 'Trading'},
  #  'facilities' => [{'name' => 'DBT'}]}

end
