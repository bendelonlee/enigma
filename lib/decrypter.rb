require_relative 'crypter'

class Decrypter < Crypter

  def initialize(string, key, reliabledate)
    super(string, key, reliabledate)
    @direction = :backward
  end

  def decrypt_string
    rotate_string_by_key_and_offsets(@string, @key, @date.reliabledate_to_offsets)
  end

  def result
    rslt = super
    rslt[:decryption] = decrypt_string
    rslt
  end

end
