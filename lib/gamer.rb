class Gamer
  attr_reader :symbol, :name
  def initialize(name:, symbol: )
    @name = name.capitalize
    assign_symbol(symbol)
  end

  private
  def assign_symbol(symbol)
    raise Error::InvalidSymbol unless %w[X O].include?(symbol)
    @symbol = symbol
  end
end