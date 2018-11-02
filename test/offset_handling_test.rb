require './test/test_helper'
require './lib/enigma'

class OffsetHandlingTest < Minitest::Test

  def setup
    @e = Enigma.new
  end

  def test_it_can_create_offsets_from_a_date_string
    assert_equal [0,2,0,1], @e.date_to_offsets('010101')
  end

  def test_it_can_generate_a_date_string_from_a_time_object
    assert_equal '010101', Time.new('2001-01-01')
  end



end
