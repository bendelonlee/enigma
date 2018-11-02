require_relative 'date_handling'
class SimpleDate
  attr_reader :ddmmyy, :date
  include DateHandling
  def initialize(date)
    @date = date
    @ddmmyy = date_to_string(date)
  end
end
