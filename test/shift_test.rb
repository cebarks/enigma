require_relative 'test_helper'

require './lib/shift'
require './lib/date_format'

class ShiftTest < Minitest::Test
  include DateFormat
  def setup
    @key = "12345"
    @date = format_date(Date.new(1970, 1, 1))
    @shift = Shift.new(@key, @date, (('a'..'z').to_a << ' '))
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
    assert_equal [20, 5, 7, 18], @shift.offset
  end

  def test_it_can_simplify_a_single_offset
    assert_equal 13, @shift.simplify_single_offset(40)
  end
end
