require './test/test_helper'
require './lib/enigma'

class DateTest < Minitest::Test

  def setup
    @e = Enigma.new
  end

  def test_it_can_generate_offsets_from_a_date
    assert_equal [0,4,0,1], @e.date_to_offsets(Date.new(2001,02,03))
  end

  def test_it_can_create_offsets_from_a_date_string
    assert_equal [0,2,0,1], @e.ddmmyy_to_offsets('010101')
  end

  def test_it_can_generate_a_date_string_from_a_time_object
    assert_equal '030201', @e.date_to_string(Time.new(2001,02,03))
  end

  def test_it_can_generate_a_date_string_from_a_date_object
    assert_equal '030201', @e.date_to_string(Date.new(2001,02,03))
  end

  def test_it_can_turn_a_ddmmyy_string_into_a_date
    actual = @e.string_to_date('030201')
    date = Date.new(2001,02,03)
    assert_equal actual.month, date.month
    assert_equal actual.year % 100, date.year % 100
  end

end
