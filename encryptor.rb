class Encryptor


	def encrypt(string, rotation)
  		letters = string.split("")
  		results = letters.collect do |letter|
		    encrypt_letter(letter, rotation)
		  end
		results.join
	end	

	def decrypt(string, rotation)
		encrypt(string, -(rotation))


	end	

	
	def encrypt_letter(letter, rotation)
  		cipher_for_rotation = cipher(rotation)
  		cipher_for_rotation[letter]

	end

	def cipher(rotation)
    	characters = (' '..'z').to_a
		rotated_characters = characters.rotate(rotation)
		Hash[characters.zip(rotated_characters)]
  end

  
end