require_relative 'test_helper'

require './lib/shift'

class ShiftTest < Minitest::Test
  def setup
    @key = "12345"
    @date = Date.new(1970, 1, 1)
    @shift = Shift.new(@key, @date)
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
    assert_equal [8, 9, 0, 0], @shift.date_offset
  end

  def test_it_has_a_key_offset
    assert_equal [12, 23, 34, 45], @shift.key_offset
  end

  def test_it_has_an_offset
    assert_equal [20, 32, 34, 45], @shift.offset
  end

  def test_it_can_simplify_a_single_offset
    assert_equal 13, @shift.simplify_single_offset(40)
  end

  def test_it_can_simplify_offset
    assert_equal [20, 5, 7, 18], @shift.simplify_offset
  end

  def test_it_can_encode_a_letter
    assert_equal 'x', @shift.encode_letter('h', 16)
  end

  def test_it_can_decode_a_letter
    assert_equal 'h', @shift.decode_letter('x', 16)
  end

  def test_it_can_encode_a_chunk
    assert_equal 'ajsc', @shift.encode('hell')
  end

  def test_it_can_decode_a_chunk
    assert_equal 'hell', @shift.decode('ajsc')
  end
end
