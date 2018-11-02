require './test/test_helper'
require './lib/simple_date'

class SimpleDateTest < Minitest::Test

  def setup
    @date = Date.new(2013, 06,01)
    @sd = SimpleDate.new(@date)
  end

  def test_it_exists
    assert_instance_of SimpleDate, @sd
  end

  def test_it_has_a_ddmmyy_string
    assert_equal '010613', @sd.ddmmyy
  end

  def test_it_has_a_date_object
    assert_equal @date, @sd.date
  end

  def test_it_will_have_a_date_object_when_initialized_with_a_ddmmmy_string
    sd = SimpleDate.new('010613')
    assert_equal @date, sd.date
  end


end
