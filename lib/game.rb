class Game
  #This class acts as the entry point for the end user
  def initialize
    @board = Board.new(3,3)
    @gamer1 = Gamer.new('x')
    @gamer2 = Gamer.new('o')
  end

  def start

  end
end