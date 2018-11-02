require 'date'
require_relative 'rotation'
require_relative 'key_handling'
require_relative 'encryption'
require_relative 'offset_handling'

class Enigma
  include Rotation
  include KeyHandling
  include Encryption
  include OffsetHandling

  def initialize(char_map_options = nil)
    @character_map = ('a'..'z').to_a << ' '
  end

end
