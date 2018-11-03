require './lib/enigma'
message_file = File.open(ARGV[0], "r")

require 'pry'; binding.pry

parsed_message = message_file.readlines.map(&:chomp).join(' ').downcase
enigma = Enigma.new




new_file_path = "./data/#{ARGV[1]}"

new_file = File.open(new_file_path, "w")
new_file.write(parsed_message)
new_file.close
