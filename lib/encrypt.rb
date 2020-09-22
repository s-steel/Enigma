require './lib/enigma'
enigma = Enigma.new


read_file = File.open(ARGV[0], 'r')

incoming_message = read_file.read

read_file.close

encrypted_message = enigma.encrypt(incoming_message, '02715', '040895')

write_encryption = File.open(ARGV[1], 'w')

write_encryption.write(encrypted_message[:encryption])

write_encryption.close

puts "Created '#{ARGV[1]}' with the key #{enigma.encryption[:key]} and date #{enigma.encryption[:date]}"
