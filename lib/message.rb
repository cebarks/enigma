class Message
  include Enumerable

  attr_reader :message

  def initialize(message)
    @message = message.downcase.scan(/.{1,4}/)
  end

  def each(&block)
    @message.each do |chunk|
      block.call(chunk)
    end
  end
end
