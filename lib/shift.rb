require_relative 'enigma'

class Shift
  attr_reader :key, :date
  def initialize(key, date)
    @key = key
    @date = date
  end

  def date_offset
    date_num = @date.strftime('%d%m%y').to_i
    date_num_string = (date_num**2).to_s
    last_4 = date_num_string[date_num_string.length-4..date_num_string.length]
    last_4.split('').map(&:to_i)
  end

  def key_offset
    offset = []
    4.times do |i|
      offset << @key[i..i+1]
    end
    offset.map(&:to_i)
  end

  def offset
    date_offset.map.with_index do |e, i|
      key_offset[i] + e
    end
  end

  def simplify_offset
    offset.map do |single_offset|
      simplify_single_offset(single_offset)
    end
  end

  def simplify_single_offset(num)
    num % Enigma::CHAR_SET.length
  end

  def encode_letter(letter, offset)
    Enigma::CHAR_SET.rotate(offset)[Enigma::CHAR_SET.find_index(letter)]
  end

  def decode_letter(letter, offset)
    Enigma::CHAR_SET.rotate(-offset)[Enigma::CHAR_SET.find_index(letter)]
  end
end
