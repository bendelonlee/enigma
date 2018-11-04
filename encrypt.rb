require './lib/enigma'
enigma = Enigma.new

message_file      = File.open(ARGV[0], "r")
parsed_message    = message_file.readlines.map(&:chomp).join(' ').downcase
encryption_result = enigma.encrypt(parsed_message)
encrypted_message = encryption_result[:encryption]
key               = encryption_result[:key]
date              = encryption_result[:date]
new_file_path     = "#{ARGV[1]}"
new_file          = File.open(new_file_path, "w")
new_file.write(encrypted_message)
new_file.close

puts "Created #{new_file_path} with the key #{key} and date #{date}"
