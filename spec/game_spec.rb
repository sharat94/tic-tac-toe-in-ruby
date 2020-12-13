require 'game'
describe Game do
  context 'if grid length added by the user is invalid' do
    it 'throws an Argument Error' do
      expect{Game.new(grid_length: 'sharat', first_gamer: 'X', second_gamer: 'Y')}.to raise_exception(ArgumentError)
    end
  end
  context 'if the user enters incorrect coordinates' do
    it 'raises an argument error' do
      expect{Game.new(grid_length: 3, first_gamer: 'X', second_gamer: 'Y').send(:sanitize_input, 'abc')}.to raise_exception(ArgumentError)
    end
  end
  context 'if the user enters valid coordinates' do
    it 'return an array of the coordinates in integer' do
      expect(Game.new(grid_length: 3, first_gamer: 'X', second_gamer: 'Y').send(:sanitize_input, '1,1')).to eq([1,1])
    end
  end
  context 'if game is not over' do
    it 'should return true' do
      game = Game.new(grid_length: 3, first_gamer: 'X', second_gamer: 'Y')
      expect(game.send(:game_still_on?)).to eq(true)
    end
  end
  context 'if input is valid validate_and_mark_input' do
    it 'should return true' do
      game = Game.new(grid_length: 3, first_gamer: 'X', second_gamer: 'Y')
      expect(game.send(:validate_and_mark_input?, [1,1])).to eq(true)
    end
  end
  context 'if input is invalid validate_and_mark_input' do
    it 'should return false' do
      game = Game.new(grid_length: 3, first_gamer: 'X', second_gamer: 'Y')
      expect(game.send(:validate_and_mark_input?, [5,5])).to eq(false)
    end
  end
  context 'if player 1 is switched' do
    it 'should change current user to player 2' do
      game = Game.new(grid_length: 3, first_gamer: 'X', second_gamer: 'Y')
      expect(game.send(:switch_gamer)).to eq(game.second_gamer)
    end
  end
end