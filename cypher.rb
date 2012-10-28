# ==================================
# Initial Setup
# ==================================

# A lowercase letter is encoded by transmitting the tones representing it, separated by gaps of duration equal to one *. A word is encoded by transmitting its encoded letters, separated by gaps of duration equal to three *. Words are separated by a single blank transmitted as a gap of duration equal to seven *. 

# Gaps separating tones within a letter appear as 0, gaps separating letters within a word appear as 000, and gaps separating words appear as 0000000. A * appears as 1 and a - appears as 111.

Letters = {"a" => "*-", "b" => "-***", "c" => "-*-*", "d" => "-**", "e" => "*", "f" => "**-*", "g" => "--*", "h" => "****", "i" => "**", "j" => "*---", "k" => "-*-", "l" => "*-**", "m" => "--", "n" => "-*", "o" => "---", "p" => "*--*", "q" => "--*-", "r" => "*-*", "s" => "***", "t" => "-", "u" => "**-", "v" => "***-", "w" => "*--", "x" => "-**-", "y" => "-*--", "z" => "--**"}

# ==================================
# Create letter decrypter
# ==================================

@decrypted_letters = {}

# Decrypt the letters
Letters.each do |key, val|
  letter_conversion = []

  # Split letter tones
  # Transform all tones and add a "0" - except for the last one
  val[0, val.length - 1].split("").each do |v|
    v = v.gsub("*", "1")
    v = v.gsub("-", "111")
    letter_conversion.push v + "0" # add the "0" gap that separates tones
  end

  # Transform the last tone (don't add a "0")
  last_char = val[-1,1]
  last_char = last_char.gsub("*", "1")
  last_char = last_char.gsub("-", "111")
  letter_conversion.push last_char

  # Combine the tones of the letter back together
  combined_tones = ""
  letter_conversion.each do |z|
    combined_tones += z
  end

  # Push the decrypted letter to decrypted_letters hash, use the Alphabetic letter for the key
  @decrypted_letters.merge!(key => combined_tones)
end

# === Print the letters ===
# Letters.each { |k,val| puts k + ": " + val }
# @decrypted_letters.each { |k,val| puts k + ": " + val }

# ==================================
# Encrypt message
# ==================================

def encrypt_message(message_to_encrypt)
  @encrypted_message = ""

  # Loop through each word in the sentence
  message_to_encrypt.split(" ").each do |word|

    # Loop through each letter in the word
    word.split("").each do |letter|
      transform_letter_to_morse(letter)
    end

    # Add word spacing
    @encrypted_message += "0000"
  end

  # Remove the trailing "0000000" of the last word
  message_length = @encrypted_message.length
  @encrypted_message = @encrypted_message[0, message_length - 7]

  # Here is the final, encrypted message
  @encrypted_message
end

def transform_letter_to_morse(letter)
  get_letter_in_morse = Letters.select{ |key, val| key == letter }
  letter_in_morse = get_letter_in_morse.values

  # Transform letter from morse to binary
  letter_in_morse.each do |l|
    transform_morse_to_binary(l)
  end
end

def transform_morse_to_binary(letter)
    # Also adding tone spacing
    letter = letter.gsub("*", "10")
    letter = letter.gsub("-", "1110")
    @encrypted_message += letter
    # Add letter spacing
    @encrypted_message += "00"
end

# ==================================
# Decypher the message
# ==================================

def decrypt_message(message_to_decrypt)
  decrypted_message = ""

  # Split message into words
  message_to_decrypt = message_to_decrypt.gsub( "0000000"," " )

  # Split words into letters
  message_to_decrypt = message_to_decrypt.gsub( "000", "_" )

  message_to_decrypt.split(" ").each do |word|
    word.split("_").each do |letter|
      decrypted_letter = @decrypted_letters.select{ |key, val| val == letter }
      decrypted_message += decrypted_letter.keys.to_s
    end
    decrypted_message += " "
  end

  # Remove all extra formatting
  decrypted_message = cleanup_decrypted_message(decrypted_message)
end

def cleanup_decrypted_message(text)
  text = text.gsub("[", "")
  text = text.gsub("]", "")
  text = text.gsub("\"", "")
end

message_to_encrypt = "welcome to the general assembly community"

encrypted_message = encrypt_message(message_to_encrypt)
puts encrypted_message

message_to_decrypt = encrypted_message
puts decrypt_message(message_to_decrypt)