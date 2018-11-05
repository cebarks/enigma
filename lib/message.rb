class Message
  include Enumerable

  attr_reader :message

  def initialize(message)
    @message = message
  end

  def each(&block)
    @message.downcase.scan(/.{1,4}/).each do |chunk|
      block.call(chunk)
    end
  end
end
