require_relative 'test_helper'

require './lib/shift'

class ShiftTest < Minitest::Test
  def setup
    @key = "12345"
    @date = Date.new(1970, 1, 1)
    @shift = Shift.new(key, date)
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_it_has_a_date
    assert_equal @date, @shift.date
  end

  def test_it_has_a_key
    assert_equal @key, @shift.key
  end

  def test_it_has_a_date_offset
    assert_equal [4, 6, 5, 6], @shift.date_offset
  end

  def test_it_has_a_key_offset
    assert_equal [12, 23, 34, 45], @shift.key_offset
  end

  def test_it_has_an_offset
    assert_equal [16, 29, 39, 51], @shift.offset
  end

  def test_it_can_simplify_offset
    assert_equal [16, 2, 12, 24], @shift.simplify_offset
  end

  def test_it_can_encode_a_letter
    assert_equal 'x', @shift.encode_letter('h', 16)
  end

  def test_it_can_decode_a_letter
    assert_equal 'h', @shift.decode_letter('x', 16)
  end

  def test_it_can_encode_a_chunk
    assert_equal 'xgxi', @shift.encode('hell')
  end

  def test_it_can_decode_a_chunk
    assert_equal 'hell', @shift.decode('xgxi')
  end
end
