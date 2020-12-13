class Board

  def initialize(grid_length: 3)
    @grid_length = grid_length.to_i
    @grid = []
    initialize_grid
  end

  def print
    @grid.each_with_index do |row, index|
      puts row.join(',').gsub(',','|')
      puts '- - -' unless index == (@grid_length - 1)
    end
  end

  def mark_input(input, player)
    if @grid.dig(input[0],input[1]).nil? || %w[X O].include?(@grid[input[0]][input[1]])
      puts "Input Invalid by player #{player.name}!"
      return false
    end
    @grid[input[0]][input[1]] = player.symbol
    true
  end

  def game_over?
    puts "diagonal_win?: #{diagonal_win?}"
    puts "row_win?: #{row_win?}"
    puts "column_win?: #{column_win?}"
    diagonal_win? || row_win? || column_win?
  end
  private

  def column_win?
    @grid_length.times.each do |i|
      matcher = []
      @grid_length.times.each do |j|
        matcher.push(@grid[j][i])
      end
      return true if ( matcher.all?{|c| c == 'X'} || matcher.all?{|r| r == 'O'})
    end
    false
  end

  def row_win?
    @grid.each do |row|
      return true if (row.all?{|r| r == 'X'} || row.all?{|r| r == 'O'})
    end
    false
  end

  def diagonal_win?
    diagonal_matcher = []
    cross_diagonal_matcher = []
    @grid_length.times.each do |i|
      diagonal_matcher.push(@grid[i][i])
      cross_diagonal_matcher.push(@grid[i][@grid_length-i])
    end
    return true if (diagonal_matcher.all?{|r| r == 'X'} || diagonal_matcher.all?{|r| r == 'O'})
    return true if (cross_diagonal_matcher.all?{|r| r == 'X'} || cross_diagonal_matcher.all?{|r| r == 'O'})
    false
  end

  def initialize_grid
    @grid_length.times.each_with_index do |a,i|
      @grid.push(Array.new(@grid_length, ' '))
    end
  end
end