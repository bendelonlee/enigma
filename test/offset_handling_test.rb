require './test/test_helper'
require './lib/enigma'

class OffsetHandlingTest < Minitest::Test

  def setup
    @e = Enigma.new
  end

  def test_it_can_create_offsets_from_a_date_string
    assert_equal [0,2,0,1], @e.date_to_offsets('010101')
  end




end
