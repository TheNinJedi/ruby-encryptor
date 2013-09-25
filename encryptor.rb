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

  def encrypt_file(filename, rotation)
	# Create the file handle to the input file
	input = File.open(filename, "r")
	# Read the text of the input file
	text = input.read
	# Encrypt the text
	encrypted_text = encrypt(text, rotation)
	# Create a name for the output file
	new_filename = filename + ".encrypted"
	# Create an output file handle
	output = File.open(new_filename, "w") 	
	# Write out the text
	output.write(encrypted_text)
	# Close the file
	output.close
  end
 end