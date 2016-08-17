require 'test_helper'

class TescoRbTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TescoRb::VERSION
  end

  def test_it_does_something_useful
    assert true
  end
end


class ConneccctionTest < Minitest::Test
  def test_initialize
    ::TescoRb
  end
end
