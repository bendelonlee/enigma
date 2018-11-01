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

  def test_it_rotates_a_letter
    assert_equal 'b', @e.rotate_letter('a', 1)
  end

  def test_it_rotates_a_string
    assert_equal 'bcad', @e.rotate_string('aaaa', '1203')
  end

end
