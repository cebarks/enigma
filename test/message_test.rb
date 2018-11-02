require_relative 'test_helper'

require './lib/message'

class MessageTest < Minitest::Test
  def setup
    @plaintext = Message.new('hello world', true)
    @ciphertext = Message.new('keder ohulw', false)
  end

  def test_it_exists
    assert_instance_of Message, @plaintext
    assert_instance_of Message, @ciphertext
  end

  def test_it_knows_if_its_plain
    refute @ciphertext.plain?
    assert @plaintext.plain?
  end

  def test_it_can_enumerate_chunks
    actual = []

    @plaintext.each do |chunk|
      actual << chunk
    end

    assert_equal %w[hell o\ wo rld], actual
  end

  def test_it_has_chunks
    assert_equal %w[hell o\ wo rld], @plaintext.chunks
  end
end
