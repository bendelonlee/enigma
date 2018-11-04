require './test/test_helper'
require './lib/crypter'
class CrypterTest < Minitest::Test

  def setup
    @date = ReliableDate.new('020400')
    @crypter = Crypter.new('this secret must be kept secret', '72113', @date)
  end

  def test_it_exists
    assert_instance_of Crypter, @crypter
  end

  def test_direction_is_set_to_forward_as_default
    assert_equal :forward, @crypter.send(:direction)
  end

  def test_it_can_recieve_a_string
    assert_equal "this secret must be kept secret", @crypter.send(:string)
  end

  def test_it_can_recieve_a_key
    assert_equal '72113', @crypter.send(:key)
  end

  def test_it_can_recieve_a_reliabledate
    assert_equal '020400', @crypter.send(:date).send(:ddmmyy)
  end

  def test_it_can_return_a_result_hash
    expected = {
      key:'72113',
      date: '020400'
    }
    assert_equal expected, @crypter.result

  end

  def test_inspect
    assert_equal "#<Crypter key:72113 date:020400>", @crypter.inspect
  end

end
