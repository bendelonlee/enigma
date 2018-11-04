require 'date'
require_relative 'key_handling'
require_relative 'encrypter'
require_relative 'decrypter'
require_relative 'cracker'
require_relative 'reliable_date'

class Enigma
  include KeyHandling

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

  def crack(string, date)
    cracker = Cracker.new(string, ReliableDate.new(date))
    key = cracker.crack
    decrypt(string, key, date)
  end

  private
  attr_reader :string, :date, :encrypter
end
