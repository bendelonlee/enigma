require './test/test_helper'
require './lib/enigma'
class CrypterTest < Minitest::Test

  def setup
    @c = Crypter.new
  end

  def test_it_exists
    assert_instance_of Crypter, @c
  end

end
