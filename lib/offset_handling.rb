module OffsetHandling

  def date_to_offsets(date_string)
    (date_string.to_i ** 2).to_s[-4..-1].chars.map(&:to_i)
  end

  def parse_time(date_or_time_object)
    date_or_time_object.to_s[2..9].delete('-')
  end


end
