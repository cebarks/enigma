require_relative 'test_helper'
require 'date'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_encrypts_a_message_given_date_and_key
    expected = { encryption: 'keder ohulw', key: '02715', date: '040895' }
    actual = @enigma.encrypt('hello world', '02715', '040895')

    assert_equal expected, actual
  end

  def test_it_decrypts_a_ciphertext_given_date_and_key
    expected = { decryption: 'hello world', key: '02715', date: '040895' }
    actual = @enigma.decrypt('keder ohulw', '02715', '040895')

    assert_equal expected, actual
  end

  def test_it_can_crack_a_ciphertext_given_date
    expected = { decryption: "hello world end", key: "55442", date: "040895" }
    actual = @enigma.crack('jedeq ohtlwtgnw', "040895")

    assert_equal expected, actual
  end

  def test_get_random_key
    actual = @enigma.get_random_key
    assert (/[0-9]{4}/).match(actual)
  end

  def test_format_date
    date = Date.new(1970, 1, 1)
    assert_equal '010170', @enigma.format_date(date)
  end
end
