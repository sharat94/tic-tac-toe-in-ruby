require 'gamer'
require 'errors/invalid_symbol'
describe Gamer do
  context 'while checking name of the gamer' do
    it 'returns the name of the gamer' do
      gamer = Gamer.new(name: 'sharat', symbol: 'X')
      expect(gamer.name).to eq 'Sharat'
    end
  end
  context 'while checking symbol of the gamer' do
    it 'returns the symbol of the gamer' do
      gamer = Gamer.new(name: 'sharat', symbol: 'X')
      expect(gamer.symbol).to eq 'X'
    end
  end
  context 'while providing incorrect symbol to gamer' do
    it 'raises an invalid symbol exception' do
      expect {Gamer.new(name: 'sharat', symbol: 'N')}.to raise_exception(InvalidSymbol)
    end
  end
end