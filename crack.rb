require './lib/enigma'
enigma = Enigma.new

date              = ARGV[2]
encrypted_file    = File.open(ARGV[0], "r")
parsed_encryption = encrypted_file.readlines.map(&:chomp).join(' ').downcase
decryption_result = enigma.crack(parsed_encryption, date)
key               = decryption_result[:key]
decrypted_message = decryption_result[:decryption]
new_file_path     = "#{ARGV[1]}"
new_file          = File.open(new_file_path, "w")
new_file.write(decrypted_message)
new_file.close

puts "Created #{new_file_path} with the cracked key #{key} and date #{date}"
