require './test/test_helper'
require './lib/enigma'
class EncryptionTest < Minitest::Test

  def setup
    @e = Enigma.new
  end

  def test_it_encrypts
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @e.encrypt("hello world", "02715", "040895")
  end

end
