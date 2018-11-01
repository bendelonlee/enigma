require './test/test_helper'
require './lib/enigma'
class EnigmaTest < Minitest::Test
  def test_it_exists
    assert_instance_of Enigma, Enigma.new
    
  end

end
