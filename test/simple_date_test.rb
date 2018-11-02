require './test/test_helper'
require './lib/simple_date'

class SimpleDateTest < Minitest::Test

  def setup
    @sd = SimpleDate.new
  end

  def test_it_exists
    assert_instance_of SimpleDate, @sd
  end

end
