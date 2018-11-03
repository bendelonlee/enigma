require_relative 'crypter'

class Encrypter < Crypter

  def encrypt_string
    require 'pry'; binding.pry
    rotate_string_by_key_and_offsets(@string, @key, @date.offsets)
  end

  def result
    super[:encryption] = encrypt_string
  end

end
