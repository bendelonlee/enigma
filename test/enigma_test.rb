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
    actual = @e.encrypt("This secret must be kept secret")
    assert_equal "Soemthing", actual
  end

  def test_it_can_recieve_an_

  end



end
