require 'gamer'
describe Gamer do
  context 'while checking name of the gamer' do
    gamer = Gamer.new(name: 'sharat', symbol: 'X')
    expect(gamer.name).to eq 'Sharat'
  end
  context 'while checking symbol of the gamer' do
    gamer = Gamer.new(name: 'sharat', symbol: 'X')
    expect(gamer.symbol).to eq 'X'
  end
  context 'while providing incorrect symbol to gamer' do
    gamer = Gamer.new(name: 'sharat', symbol: 'N')
    expect(gamer.symbol).to raise_error(Error::InvalidSymbol)
  end
end