require 'date'
require_relative 'key_handling'
require_relative 'encrypter'
require_relative 'decrypter'
require_relative 'date_handling'
require_relative 'reliable_date'

class Enigma
  include KeyHandling
  include DateHandling

  def encrypt(string = nil, key = nil, date = nil, on = true)
    unencrypted_string ||= string
    key                ||= random_key
    @encrypter = Encrypter.new(unencrypted_string, key, ReliableDate.new(date))
    @encrypter.result if on
  end

  def decrypt(string = nil, key = nil, date = nil, on = true)
    unencrypted_string ||= string
    key                ||= random_key
    @decrypter = Decrypter.new(unencrypted_string, key, ReliableDate.new(date))
    @decrypter.result if on
  end

  private
  attr_reader :string, :date, :encrypter
end
