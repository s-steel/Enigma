require './lib/enigma'
enigma = Enigma.new


read_file = File.open(ARGV[0], 'r')

incoming_message = read_file.read

read_file.close

decrypted_message = enigma.decrypt(incoming_message, ARGV[2], ARGV[3])

write_decryption = File.open(ARGV[1], 'w')

write_decryption.write(decrypted_message[:decryption])

write_decryption.close

puts "Created '#{ARGV[1]}' with the key #{enigma.decryption[:key]} and date #{enigma.decryption[:date]}"
