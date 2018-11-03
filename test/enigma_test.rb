require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @e = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @e
  end

  def test_it_encrypts
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @e.encrypt("hello world", "02715", "040895")
  end

  def test_it_decrypts

    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @e.decrypt('keder ohulw', '02715', '040895')
  end


  def test_it_can_decrypt_was_just_encrypted_with_todays_date
    secret = "this secret must remain secret"
    encryption = @e.encrypt(secret, "02715")[:encryption]
    assert_equal secret, @e.decrypt(encryption, "02715")[:decryption]
  end

  # def test_it_generates_a_random_key_if_no_key_given
  #   @e.encrypt("This secret must be kept secret", nil, nil, false)
  #   actual = @e.send(:encrypter).send(:key)
  #   assert_equal 5, actual.size
  #   assert_instance_of String, actual
  #   assert actual[/\d{4}/]
  # end

end
