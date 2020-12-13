require 'board'
describe Board do
  context 'if input given is invalid' do
    it 'returns false' do
      gamer = Gamer.new(name: 'sharat', symbol: 'X')
      input = [6,6]
      expect(Board.new(grid_length: 3).send(:mark_input,input, gamer)).to eq(false)
    end
  end
  context 'if input given is valid' do
    it 'returns false' do
      gamer = Gamer.new(name: 'sharat', symbol: 'X')
      input = [1,1]
      expect(Board.new(grid_length: 3).send(:mark_input,input, gamer)).to eq(true)
    end
  end
  context 'when grid is initialized' do
    it 'returns a valid grid' do
      expect(Board.new(grid_length: 3).grid).to eq([Array.new(3,' '), Array.new(3,' '), Array.new(3,' ')])
    end
  end
  context 'when grid has a diagonal win' do
    it "should return true" do
      board = Board.new(grid_length: 3)
      gamer = Gamer.new(name: 'sharat', symbol: 'X')
      inputs = [[0,0], [1,1], [2,2]]
      inputs.map{ |input| board.send(:mark_input,input, gamer)}
      expect(board.send(:diagonal_win?)).to eq(true)
    end
  end
  context 'when grid has a cross diagonal win' do
    it "should return true" do
      board = Board.new(grid_length: 3)
      gamer = Gamer.new(name: 'sharat', symbol: 'X')
      inputs = [[0,2], [1,1], [2,0]]
      inputs.map{ |input| board.send(:mark_input,input, gamer)}
      expect(board.send(:diagonal_win?)).to eq(true)
    end
  end
  context 'when grid has a row win' do
    it "should return true" do
      board = Board.new(grid_length: 3)
      gamer = Gamer.new(name: 'sharat', symbol: 'X')
      inputs = [[1,0], [1,1], [1,2]]
      inputs.map{ |input| board.send(:mark_input,input, gamer)}
      expect(board.send(:row_win?)).to eq(true)
    end
  end
  context 'when grid has a column win' do
    it "should return true" do
      board = Board.new(grid_length: 3)
      gamer = Gamer.new(name: 'sharat', symbol: 'X')
      inputs = [[0,1], [1,1], [2,1]]
      inputs.map{ |input| board.send(:mark_input,input, gamer)}
      expect(board.send(:column_win?)).to eq(true)
    end
  end
end