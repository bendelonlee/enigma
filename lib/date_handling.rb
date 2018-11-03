require 'date'
module DateHandling

  def reliabledate_to_offsets
    ddmmyy_to_offsets(self.ddmmyy)
  end

  def ddmmyy_to_offsets(date_string)
    (date_string.to_i ** 2).to_s[-4..-1].chars.map(&:to_i)
  end

  def date_to_string(date)
    year_month_day = date.to_s[2..9].delete('-')
    year_month_day.chars.each_slice(2).to_a.reverse.join
  end

  def string_to_date(string)
    nums = string.chars.each_slice(2).to_a.reverse.map { |pair| pair.join.to_i }
    Date.new(*nums)
  end

end
