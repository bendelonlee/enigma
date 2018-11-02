module Encryption

  def encrypt_string(string)
    rotate_string_by_key_and_offsets(string, @key, date_to_offets(@date))
  end

  def return_encryption_as_a_hash
    {
    encryption: encrypt_string(@string),
    key: @key,
    date: date_to_string(@date)
    }
  end

end
