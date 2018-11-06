class Cipher
  def initialize(shift)
    @offset = shift.offset
    @charset = shift.charset
  end

  def shift_letter(letter, offset, direction)
    return letter unless @charset.include?(letter)
    @charset.rotate(offset * direction)[@charset.find_index(letter)]
  end

  def shift(chunk, direction)
    chunk.split('').map.with_index do |let, i|
      shift_letter(let, @offset[i], direction)
    end.join()
  end

  def shift_message(message, direction)
    message.map do |chunk|
      shift(chunk, direction)
    end.join('')
  end

  def encode_message(message)
    shift_message(message, 1)
  end

  def decode_message(message)
    shift_message(message, -1)
  end
end
