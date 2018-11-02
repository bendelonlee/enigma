require 'date'
require_relative 'rotation'
require_relative 'key_handling'
require_relative 'encryption'
require_relative 'date_handling'

class Enigma
  include Rotation
  include KeyHandling
  include Encryption
  include DateHandling

  def initialize(char_map_options = nil)
    @character_map = ('a'..'z').to_a << ' '
  end

  def encrypt(string, key = nil, date = nil)
    @string ||= string
    @key = key ? key : random_key
    @date = get_actual_date(date)
  end

  def get_actual_date(date)
    if date && date.is_a?(Date)
      date
    elsif date && date.is_a?(String)
      string_to_date(date)
    else
      Date.today
    end
  end

  private
  attr_reader :string, :key, :date
end
