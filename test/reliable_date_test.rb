require './test/test_helper'
require './lib/reliable_date'

class ReliableDateTest < Minitest::Test

  def setup
    @date = Date.new(2013, 06,01)
    @sd = ReliableDate.new(@date)
  end

  def test_it_exists
    assert_instance_of ReliableDate, @sd
  end

  def test_it_has_a_ddmmyy_string
    assert_equal '010613', @sd.ddmmyy
  end

  def test_it_has_a_date_object
    assert_equal @date, @sd.date
  end

  def test_it_will_have_correct_date_object_when_initialized_with_a_ddmmmy_string
    sd = ReliableDate.new('010613')
    actual = sd.date
    assert_instance_of Date, actual
    assert_equal actual.month, @date.month
    assert_equal actual.day, @date.day
    assert_equal actual.year % 100, @date.year % 100
  end

  def test_it_is_today_if_argument_is_nil
    sd = ReliableDate.new(nil)
    assert_equal Date.today, sd.date
  end

  def test_it_is_today_if_no_argument
    sd = ReliableDate.new
    assert_equal Date.today, sd.date
  end


end
