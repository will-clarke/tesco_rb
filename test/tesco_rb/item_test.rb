require 'test_helper'

class ItemTest < Minitest::Test
  def test_dynamic_initialization
    bob = TescoRb::Item.new(is: 'awesome')
    assert_equal bob.is, 'awesome'
    chris = TescoRb::Item.new(thinks_he_is: 'cool', actually: 'isnt')
    assert_equal chris.thinks_he_is, 'cool'
    assert_equal chris.actually, 'isnt'
  end

  def test_equality
    bob = TescoRb::Item.new(is: 'awesome')
    not_bob = TescoRb::Item.new(is: 'loser')
    close_enough = TescoRb::Item.new(is: 'awesome')
    assert bob != not_bob
    assert bob == close_enough
  end
end
