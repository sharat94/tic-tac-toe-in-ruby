class Gamer
  attr_reader :symbol
  def initialize(name:, symbol: )
    @name = name.capitalize
    @symbol = symbol
  end
end