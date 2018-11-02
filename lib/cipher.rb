class Cipher
  def initialize(shift)
    @offset = shift.simplify_offset
  end

  def encode_letter(letter, offset)
    Enigma::CHAR_SET.rotate(offset)[Enigma::CHAR_SET.find_index(letter)]
  end

  def decode_letter(letter, offset)
    Enigma::CHAR_SET.rotate(-offset)[Enigma::CHAR_SET.find_index(letter)]
  end

  def encode(chunk)
    chunk.split('').map.with_index do |let, i|
      encode_letter(let, @offset[i])
    end.join()
  end

  def decode(chunk)
    chunk.split('').map.with_index do |let, i|
      decode_letter(let, @offset[i])
    end.join()
  end
end
