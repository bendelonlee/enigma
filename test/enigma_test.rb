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
    skip
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @e.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_store_a_ddmmyy_string_as_a_date
    @e.encrypt(nil, nil, "040895")
    assert_equal Date.new(95,8,4), @e.send(:date)
  end

  def test_it_can_recieve_a_string_from_encrypt_method
    @e.encrypt("This secret must be kept secret")
    assert_equal "This secret must be kept secret", @e.send(:string)
  end

  def test_it_can_recieve_a_key_from_encrypt_method
    @e.encrypt("This secret must be kept secret", '72113')
    assert_equal '72113', @e.send(:key)
  end

  def test_it_can_recieve_a_date_from_encrypt_method
    date = Date.new(2000, 04, 02)
    @e.encrypt("This secret must be kept secret", '72113', date)
    assert_equal date, @e.send(:date)
  end

  def test_it_uses_todays_date_if_no_date_given
    date = Date.today
    @e.encrypt("This secret must be kept secret", '72113')
    assert_equal date, @e.send(:date)
  end

  def test_it_generates_a_random_key_if_no_key_given
    @e.encrypt("This secret must be kept secret")
    actual = @e.send(:key)
    assert_equal 5, actual.size
    assert_instance_of String, actual
    assert actual[/\d{4}/]
  end

end
