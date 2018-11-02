require 'date'
require_relative 'key_handling'
require_relative 'encrypter'
require_relative 'date_handling'

class Enigma
  include KeyHandling
  include DateHandling

  def initialize(char_map_options = nil)

  end

  def encrypt(string = nil, key = nil, date = nil, on = true)
    unencrypted_string ||= string
    key                ||= random_key
    @encrypter = Encrypter.new(unencrypted_string, key, SimpleDate.new(date))
    @encrypter.result if on
  end

  private
  attr_reader :string, :date, :encrypter
end
