class Message
  include Enumerable

  def initialize(message, plaintext)
    @chunks = message.scan(/.{1,4}/)
    @plain = plaintext
  end

  def each(&block)
    @chunks.each do |chunk|
      yield chunk
    end
  end
end
