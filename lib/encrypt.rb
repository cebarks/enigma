#!/usr/bin/env ruby
require 'date'
require_relative 'enigma'

output_file = File.new(ARGV[1], "w")

enigma = Enigma.new
date = enigma.format_date(Date.today)
key = enigma.get_random_key

File.foreach(ARGV[0]) do |line|
  encrypted = enigma.encrypt(line, key, date)
  output_file.puts(encrypted[:encryption])
end

puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"

output_file.close
