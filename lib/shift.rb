class Shift
  attr_reader :key, :date, :charset
  def initialize(key, date, charset)
    @key = key
    @date = date
    @charset = charset
  end

  def date_offset
    date_str = (@date.to_i ** 2).to_s
    last_4 = date_str[date_str.length - 4..date_str.length]
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
      simplify_single_offset(key_offset[i] + e)
    end
  end

  def simplify_single_offset(num)
    num % @charset.length
  end
end
