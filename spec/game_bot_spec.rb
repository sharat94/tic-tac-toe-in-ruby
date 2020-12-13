require 'gamer'
require 'game_bot'
require 'errors/invalid_symbol'
describe GameBot do
  context 'while checking name of the gamer' do
    it 'returns the name of the gamer' do
      gamer = GameBot.new(name: 'SharatBot', symbol: 'X', difficulty: 1)
      expect(gamer.name).to eq 'Sharatbot'
    end
  end
  context 'while checking symbol of the gamer' do
    it 'returns the symbol of the gamer' do
      gamer = GameBot.new(name: 'SharatBot', symbol: 'X', difficulty: 1)
      expect(gamer.symbol).to eq 'X'
    end
  end
  context 'while providing incorrect symbol to gamer' do
    it 'raises an invalid symbol exception' do
      expect {GameBot.new(name: 'SharatBot', symbol: 'N', difficulty: 1)}.to raise_exception(InvalidSymbol)
    end
  end
  context 'while player tries to win a row' do
    it 'should try to block the win' do
      gamer = Gamer.new(name: 'Sharat', symbol: 'X')
      gamebot = GameBot.new(name: 'Sharatbot', symbol: 'O', difficulty: 1)
      board = Board.new(grid_length: 3)
      inputs = [[0,0], [1,1]]
      inputs.map{ |input| board.send(:mark_input,input, gamer)}
      expect(gamebot.make_move(board: board)).to eq([2,2].join(','))
    end
  end
  context 'while player tries to win a column' do
    it 'should try to block the win' do
      gamer = Gamer.new(name: 'Sharat', symbol: 'X')
      gamebot = GameBot.new(name: 'Sharatbot', symbol: 'O', difficulty: 1)
      board = Board.new(grid_length: 3)
      inputs = [[0,1], [1,1]]
      inputs.map{ |input| board.send(:mark_input,input, gamer)}
      expect(gamebot.make_move(board: board)).to eq([2,1].join(','))
    end
  end
  context 'while player tries to win a diagonal win' do
    it 'should try to block the win' do
      gamer = Gamer.new(name: 'Sharat', symbol: 'X')
      gamebot = GameBot.new(name: 'Sharatbot', symbol: 'O', difficulty: 1)
      board = Board.new(grid_length: 3)
      inputs = [[0,0], [1,1]]
      inputs.map{ |input| board.send(:mark_input,input, gamer)}
      expect(gamebot.make_move(board: board)).to eq([2,2].join(','))
    end
  end
  context 'while player tries to win a cross diagonal win' do
    it 'should try to block the win' do
      gamer = Gamer.new(name: 'Sharat', symbol: 'X')
      gamebot = GameBot.new(name: 'Sharatbot', symbol: 'O', difficulty: 1)
      board = Board.new(grid_length: 3)
      inputs = [[0,2], [1,1]]
      inputs.map{ |input| board.send(:mark_input,input, gamer)}
      expect(gamebot.make_move(board: board)).to eq([2,0].join(','))
    end
  end
  context 'while player has no winning combinations' do
    it 'should play randomly' do
      gamer = Gamer.new(name: 'Sharat', symbol: 'X')
      gamebot = GameBot.new(name: 'Sharatbot', symbol: 'O', difficulty: 1)
      board = Board.new(grid_length: 3)
      inputs = [[0,0], [2,1]]
      inputs.map{ |input| board.send(:mark_input,input, gamer)}
      expect(gamebot.make_move(board: board)).to be_a String
    end
  end
end

