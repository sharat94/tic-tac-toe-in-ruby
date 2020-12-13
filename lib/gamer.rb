require_relative 'errors/invalid_symbol'
class Gamer
  attr_reader :symbol, :name
  def initialize(name:, symbol: )
    @name = name.capitalize
    assign_symbol(symbol)
  end

  private
  def assign_symbol(symbol)
    raise InvalidSymbol.new('invalid symbol') unless %w[X O].include?(symbol)
    @symbol = symbol
  end
end