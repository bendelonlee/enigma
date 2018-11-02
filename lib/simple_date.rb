require_relative 'date_handling'
class SimpleDate
  attr_reader :ddmmyy, :date
  include DateHandling
  def initialize(date = nil)
    if date.is_a?(Date) || date == nil
      @date = date ? date : Date.today
      @ddmmyy = date_to_string(date)
    elsif date.is_a?(String)
      @date = string_to_date(date)
      @ddmmyy = date
    end
  end

end
