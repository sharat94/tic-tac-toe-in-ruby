#!/usr/bin/env ruby
require './lib/board'
require './lib/game'
require './lib/gamer'

while true
  begin
    puts 'Enter grid size'
    grid_length = Integer(gets.strip)
    puts 'Enter player 1 name'
    first_gamer = gets.strip
    puts 'Enter player 2 name'
    second_gamer = gets.strip
    Game.new(grid_length: grid_length,
             first_gamer: first_gamer,
             second_gamer: second_gamer).start
  rescue ArgumentError
    puts 'INVALID INPUT'
  end
end