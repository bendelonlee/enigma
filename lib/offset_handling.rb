module OffsetHandling

  def date_to_offsets(date_string)
    (date_string.to_i ** 2).to_s[-4..-1].chars.map(&:to_i)
  end

  def parse_time(date_or_time_object)
    year_month_day = date_or_time_object.to_s[2..9].delete('-')
    year_month_day.chars.each_slice(2).to_a.reverse.join
  end

end
