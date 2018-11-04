require_relative 'rotation'
require_relative 'key_handling'
require_relative 'reliable_date'
class Crypter

  include KeyHandling
  include Rotation

  DEFAULT_CHARACTER_MAP = ('a'..'z').to_a << ' '

  def initialize(string, key, reliabledate)
    @string = string
    @key = key
    @date = reliabledate
    set_defaults
  end

  def set_defaults
    @character_map = DEFAULT_CHARACTER_MAP
    @direction = :forward
  end

  def result
    {
      key: @key,
      date: @date.ddmmyy
    }
  end

  def inspect
    "#<#{self.class} key:#{@key} date:#{@date.ddmmyy}>"
  end

  private

  attr_reader :string, :key, :date, :direction

end
