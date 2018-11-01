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
    asssert_equal "Soemthing", actual
  end

  def test_it_rotates_a_letter
    asssert_equal 'b', @e.rotate_letter('a', '1')
  end

  def test_it_rotates_a_string
    asssert_equal 'bcad', @e.rotate_letter('aaaa', '1203')
  end

end
