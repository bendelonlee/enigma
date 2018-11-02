require './test/test_helper'
require './lib/simpe_date'

class SimpleDate < Minitest::Test

  def setup
    @sd = SimpleDate.new
  end

  def test_it_exists
    assert_instance_of SimpleDate, @sd
  end

end
