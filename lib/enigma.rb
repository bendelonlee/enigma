require 'date'
require_relative 'rotation'
require_relative 'key_handling'
require_relative 'encrypter'
require_relative 'date_handling'

class Enigma
  include Rotation
  include KeyHandling
  include DateHandling

  def initialize(char_map_options = nil)
    @character_map = ('a'..'z').to_a << ' '
  end

  def encrypt(string = nil, key = nil, date = nil, on = true)
    unencrypted_string ||= string
    definite_key       ||= random_key
    @date                = get_actual_date(date)
    ddmmyy               = date_to_string(date)
    @encrypter = Encrypter.new
    @encrypt.result
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
