require_relative 'crypter'

class Encrypter < Crypter

  def encrypt_string
    rotate_string_by_key_and_offsets(@string, @key, date_to_offsets(@date))
  end

  def result
    super[:encryption] = encrypt_string
  end

end
