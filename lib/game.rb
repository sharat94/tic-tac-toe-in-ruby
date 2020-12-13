class Game
  #This class acts as the entry point for the end user
  def initialize(grid_length: , first_gamer:, second_gamer:)
    @board = Board.new(grid_length: grid_length.to_i)
    @first_gamer = Gamer.new(name: first_gamer, symbol: 'X')
    @second_gamer = Gamer.new(name: second_gamer, symbol: 'O')
    @current_gamer = @first_gamer
  end

  def start
    while game_still_on? do
      @board.print
      puts "Enter coordinates for #{@current_gamer.name} playing as #{@current_gamer.symbol}"
      input = sanitize_input(gets.strip)
      switch_gamer if validate_and_mark_input(input)
    end
    winner = switch_gamer
    puts "Winner is #{winner.name} !!!"
  end

  private

  def sanitize_input(input)
    input.split(',').map!{|i| Integer(i)}
  end
  def switch_gamer
    @current_gamer = @current_gamer == @first_gamer ? @second_gamer : @first_gamer
  end
  def validate_and_mark_input(input)
    @board.mark_input(input, @current_gamer)
  end
  def game_still_on?
    !@board.game_over?
  end
end