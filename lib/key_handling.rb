module KeyHandling
  def random_key(length = nil)
    length ||= 4
    n = rand(10**length)
    int_to_string(n, length)
  end

  def int_to_string(int, length)
    str = int.to_s
    diff = length - str.size
    '0' * diff + str
  end

  def key_to_amounts(key)
    key.chars.each_cons(2).map { |pair| pair.join.to_i }
  end

  def key_to_amounts_with_offsets(key, offsets)
    offsets_cycle = offsets.cycle
    key_to_amounts(key).map { |n| n + offsets_cycle.next }
  end
end
