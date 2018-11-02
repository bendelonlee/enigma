require_relative 'rotation'
require_relative 'key_handling'
require_relative 'date_handling'
class Crypter
  include KeyHandling
  include Rotation
  include DateHandling

  DEFAULT_CHARACTER_MAP = ('a'..'z').to_a << ' '

  def initialize(string, key, ddmmyy)
    @string = string
    @key = key
    @ddmmyy = ddmmyy
    @character_map = DEFAULT_CHARACTER_MAP
  end

  def result
    {
      key: @key,
      date: @ddmmyy
    }
  end


  private

  attr_reader :string, :key, :ddmmyy

end
