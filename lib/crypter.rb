class Crypter

  def initialize(string, key, ddmmyy)
    @string = string
    @key = key
    @ddmmyy = ddmmyy
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
