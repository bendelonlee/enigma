require_relative 'crypter'

class Encrypter < Crypter

  def encrypt_string
    rotate_string_by_key_and_offsets(@string, @key, simpleDate_to_offsets(@date))
  end

  def result
    rslt = super
    rslt[:encryption] = encrypt_string
    rslt
  end

end
