class Message
  include Enumerable

  def initialize(message, plaintext)
    @chunks = message.downcase.scan(/.{1,4}/)
    @plain = plaintext
  end

  def each(&block)
    @chunks.each do |chunk|
      block.call(chunk)
    end
  end
end
