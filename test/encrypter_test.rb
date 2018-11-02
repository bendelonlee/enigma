require './test/test_helper'
require './lib/encrypter'
require 'date'

class EncrypterTest < Minitest::Test
  def setup
    @encrypter = Encrypter.new('hello world', '02715', '040895')
  end

  def test_it_encrypts_a_string
    assert_equal 'keder ohulw', @encrypter.encrypt_string
  end

  def test_it_returns_a_hash_as_a_result
  end

end
