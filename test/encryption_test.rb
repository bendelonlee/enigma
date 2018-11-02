require './test/test_helper'
require './lib/enigma'
require 'date'
class EncryptionTest < Minitest::Test
  def setup
    @e = Enigma.new
  end

  def test_it_encrypts_a_string
    @e.encrypt(nil, "02715", Date.new(1995, 8, 4), false)
    assert_equal 'keder ohulw', @e.encrypt_string("hello world")
  end

end
