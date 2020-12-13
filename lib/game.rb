require_relative 'board'
require_relative 'gamer'
require_relative 'game_bot'
class Game
  #This class acts as the entry point for the end user
  attr_reader :second_gamer, :first_gamer, :current_gamer
  def initialize(grid_length: , first_gamer:, second_gamer:)
    @board = Board.new(grid_length: Integer(grid_length))
    @first_gamer = Gamer.new(name: first_gamer, symbol: 'X')
    assign_second_gamer(second_gamer)
    @current_gamer = @first_gamer
  end

  def start
    while game_still_on? do
      if @current_gamer.bot?
        input = sanitize_input(@current_gamer.make_move(board: @board))
      else
        @board.print
        puts "Enter coordinates for #{@current_gamer.name} playing as #{@current_gamer.symbol}"
        input = sanitize_input(gets.strip)
      end
      puts "the input is #{input}"
      switch_gamer if validate_and_mark_input?(input)
    end
    winner = switch_gamer
    puts "Winner is #{winner.name} !!!"
  end

  private

  def assign_second_gamer(gamer)
    if gamer.empty?
      return @second_gamer = GameBot.new(name: 'SharatBot', symbol: 'O', difficulty: 1)
    end
    @second_gamer = Gamer.new(name: second_gamer, symbol: 'O')
  end

  def sanitize_input(input)
    input.split(',').map!{|i| Integer(i)}
  end
  def switch_gamer
    @current_gamer = @current_gamer == @first_gamer ? @second_gamer : @first_gamer
  end
  def validate_and_mark_input?(input)
    @board.mark_input(input, @current_gamer)
  end
  def game_still_on?
    !@board.game_over?
  end
end