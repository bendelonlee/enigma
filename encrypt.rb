require './lib/enigma'
enigma = Enigma.new

message_file      = File.open(ARGV[0], "r")
parsed_message    = message_file.readlines.map(&:chomp).join(' ').downcase
encrypted_message = enigma.encrypt(parsed_message)[:encryption]
new_file_path     = "./data/#{ARGV[1]}"
new_file          = File.open(new_file_path, "w")
new_file.write(encrypted_message)
new_file.close
