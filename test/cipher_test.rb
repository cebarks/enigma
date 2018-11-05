require_relative 'test_helper'

require 'date'
require './lib/cipher'
require './lib/shift'
require './lib/date_format'

class CipherTest < Minitest::Test
  include DateFormat
  def setup
    @key = "12345"
    @date = Date.new(1970, 1, 1)
    @shift = Shift.new(@key, format_date(@date))
    @cipher = Cipher.new(@shift)
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end

  def test_it_can_encode_a_letter
    assert_equal 'x', @cipher.encode_letter('h', 16)
  end

  def test_it_can_decode_a_letter
    assert_equal 'h', @cipher.decode_letter('x', 16)
  end

  def test_it_can_encode_a_chunk
    assert_equal 'ajsc', @cipher.encode('hell')
  end

  def test_it_can_decode_a_chunk
    assert_equal 'hell', @cipher.decode('ajsc')
  end
end
