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
end
