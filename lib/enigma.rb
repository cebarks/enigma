class Enigma
  CHAR_SET = (('a'..'z').to_a << ' ').freeze

  

  def get_random_key
    key = rand(0..99999).to_s

    until key.length == 5
      key.prepend('0')
    end
    
    key
  end
end
