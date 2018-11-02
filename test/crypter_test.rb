require './test/test_helper'
require './lib/enigma'
class CrypterTest < Minitest::Test

  def setup
    @crypter = Crypter.new('this secret must be kept secret', '72113', '020400')
  end

  def test_it_exists
    assert_instance_of Crypter, @crypter
  end

  def test_it_can_recieve_a_string
    assert_equal "this secret must be kept secret", @crypter.send(:string)
  end

  def test_it_can_recieve_a_key
    assert_equal '72113', @crypter.send(:key)
  end

  def test_it_can_recieve_a_ddmmyy
    assert_equal '020400', @crypter.send(:ddmmyy)
  end

end
