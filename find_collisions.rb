#!/usr/bin/env ruby

require './lib/enigma'
e = Enigma.new

date = ARGV[0]

dupes = (1..99999).group_by do |i|
  e.encrypt("hello world end", i.to_s.rjust(5, '0'), date)[:encryption]
end.select {|k, v| v.length > 1}

dupes.each do |dupe|
  p dupe
end
