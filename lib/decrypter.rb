require_relative 'crypter'

class Encrypter < Crypter

  def decrypt_string
    rotate_string_by_key_and_offsets(@string, @key, @date.simpleDate_to_offsets)
  end

  def result
    rslt = super
    rslt[:encryption] = encrypt_string
    rslt
  end

end
