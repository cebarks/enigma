require_relative 'test_helper'

require './lib/message'

class MessageTest < Minitest::Test
  def setup
    @message = Message.new('hello world')
  end

  def test_it_exists
    assert_instance_of Message, @message
  end

  def test_it_can_enumerate_chunks
    assert_equal %w[hell o\ wo rld], @message.each {}
  end

  def test_it_has_a_message
    assert_equal 'hello world', @message.message
  end
end
