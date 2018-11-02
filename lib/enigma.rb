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
    key       ||= random_key
    ddmmyy = record_date_and_return_ddmmyy(date)
    @encrypter = Encrypter.new(unencrypted_string, key, ddmmyy)
    @encrypter.result if on
  end

  def record_date_and_return_ddmmyy(date)
    if date && date.is_a?(Date)
      @date = date
      date_to_string(date)
    elsif date && date.is_a?(String)
      @date = string_to_date(date)
      date
    else
      Date.today
    end
  end

  private
  attr_reader :string, :date, :encrypter
end
