#!/usr/bin/env ruby
require_relative 'enigma'

output_file = File.new(ARGV[1], "w")

enigma = Enigma.new
key = ARGV[2]
date = ARGV[3]


File.foreach(ARGV[0]) do |line|
  decrypted = enigma.decrypt(line, key, date)
  output_file.puts(decrypted[:decryption])
end

puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"

output_file.close
