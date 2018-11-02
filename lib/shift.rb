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
end
