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
    @character_map = DEFAULT_CHARACTER_MAP
    @direction = :forward
  endsdf
  SFD

  def result
    {
      key: @key,
      date: @date.ddmmyy
    }
  end

  def inspect
    "#<key:#{@key} date:#{@date.ddmmyy}>"
  end

  private

  attr_reader :string, :key, :date, :direction

end
