require './lib/enigma'

enigma = Enigma.new

enigma.decrypt('keder ohulw', '02715', '040895')

puts "Created 'decrypted.txt' with the key #{enigma.decryption[:key]} and date #{enigma.decryption[:date]}"
# $ ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 240818
# $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
# Created 'decrypted.txt' with the key 82648 and date 240818
