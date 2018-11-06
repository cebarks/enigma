#!/usr/bin/env ruby
require_relative 'enigma'

output_file = File.new(ARGV[1], "w")

enigma = Enigma.new
date = ARGV[2]
key = ""

File.foreach(ARGV[0]) do |line|
  cracked = enigma.crack(line, date)
  output_file.puts(cracked[:decryption])
  key = cracked[:key]
end

puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"

output_file.close
