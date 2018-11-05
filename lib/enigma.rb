require_relative 'message'
require_relative 'shift'
require_relative 'cipher'
require_relative 'date_format'

class Enigma
  include DateFormat
  def encrypt(plaintext, key = get_random_key, date = format_date(Date.today))
    message = Message.new(plaintext)
    shift = Shift.new(key, date, Enigma.default_charset)
    cipher = Cipher.new(shift)

    ciphertext = message.map do |chunk|
      cipher.encode(chunk)
    end.join('')

    { encryption: ciphertext, key: key, date: date }
  end

  def decrypt(ciphertext, key = get_random_key, date = format_date(Date.today))
    message = Message.new(ciphertext)
    shift = Shift.new(key, date, Enigma.default_charset)
    cipher = Cipher.new(shift)

    ciphertext = message.map do |chunk|
      cipher.decode(chunk)
    end.join('')

    { decryption: ciphertext, key: key, date: date }
  end

  def get_random_key
    rand(0..99999).to_s.rjust(5, '0')
  end

  def self.default_charset
    (('a'..'z').to_a << ' ')
  end
end
