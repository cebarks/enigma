require_relative 'test_helper'
require 'date'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = EnigmaTest.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_encrypts_a_message

  end

  def test_it_encrypts_a_message_given_key

  end

  def test_it_encrypts_a_message_given_date_and_key
    expected = { encryption: "keder ohulw", key: "02715", date: "040895" }
    actual = @enigma.encrypt("hello world", "02715", "040895")

    assert_equal expected, actual
  end

  def test_it_decrypts_a_ciphertext_given_date_and_key
    expected = { decryption: "hello world", key: "02715", date: "040895" }
    actual = @enigma.decrypt("keder ohulw", "02715", "040895")

    assert_equal expected, actual
  end
end