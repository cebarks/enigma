require_relative 'test_helper'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = EnigmaTest.new
  end

  def test_it_exists
    assert_instance_of EnigmaTest, @enigma
  end

  def test_it_encrypts

  end
end
