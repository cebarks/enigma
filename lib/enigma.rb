
require_relative 'message'
require_relative 'shift'
require_relative 'cipher'

class Enigma
  CHAR_SET = (('a'..'z').to_a << ' ').freeze

  def encrypt(plaintext, key = get_random_key, date = format_date(Date.today))
    message = Message.new(plaintext)
    shift = Shift.new(key, date)
    cipher = Cipher.new(shift)

    ciphertext = message.map do |chunk|
      cipher.encode(chunk)
    end.join('')

    { encryption: ciphertext, key: key, date: date }
  end

  def decrypt(ciphertext, key = get_random_key, date = format_date(Date.today))
    message = Message.new(ciphertext)
    shift = Shift.new(key, date)
    cipher = Cipher.new(shift)

    ciphertext = message.map do |chunk|
      cipher.decode(chunk)
    end.join('')

    { decryption: ciphertext, key: key, date: date }
  end

  def format_date(date)
    date.strftime('%d%m%y')
  end

  def get_random_key
    rand(0..99999).to_s.rjust(5, '0')
  end
end
