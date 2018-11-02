require 'date'
require_relative 'rotation'
require_relative 'key_handling'

class Enigma
  include Rotation
  include KeyHandling

  def initialize(char_map_options = nil)
    @character_map = ('a'..'z').to_a << ' '
  end

end
