module Encryption

  def encrypt_string(string)
    rotate_string_by_key_and_offsets(string, @key, date_to_offets(@date))
  end


end
