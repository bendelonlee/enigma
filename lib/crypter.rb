require_relative 'rotation'
require_relative 'key_handling'
require_relative 'date_handling'
class Crypter
  include KeyHandling
  include Rotation
  include DateHandling

  def initialize(string, key, ddmmyy, character_map)
    @string = string
    @key = key
    @ddmmyy = ddmmyy
    @character_map = character_map
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
