require_relative 'rotation'
require_relative 'key_handling'
require_relative 'date_handling'
class Crypter
  include KeyHandling
  include Rotation
  include DateHandling

  DEFAULT_CHARACTER_MAP = ('a'..'z').to_a << ' '

  def initialize(string, key, date)
    @string = string
    @key = key
    @date = date
    @character_map = DEFAULT_CHARACTER_MAP
  end

  def result
    {
      key: @key,
      date: @date.ddmmyy
    }
  end

  def inspect
    "<key:#{@key} date:#{@date.ddmmyy}"
  end


  private

  attr_reader :string, :key, :date

end
