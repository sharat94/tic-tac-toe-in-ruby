class GameBot < Gamer
  def initialize(name:, symbol:, difficulty:)
    super(name: name, symbol: symbol)
    #can use logic to swiitch algorithim used based on difficulty setting
  end

  def bot?
    true
  end

  def make_move(board:)
    grid = board.grid
    coordinates = block_row_win(grid) || block_column_win(grid) || block_diagonal_win(grid) || random_move(grid)
    coordinates.join(',')
  end

  private

  def block_row_win(grid)
    grid.each_with_index do |row, i|
      x_count = 0
      row.each_with_index do |cell, j|
        x_count += 1 if cell == 'X'
        return [i, (j + 1)] if x_count > (grid.length - 2) && !grid.dig(i, j + 1).nil? && grid[i][j + 1].strip.empty?
      end
    end
    nil
  end

  def block_column_win(grid)
    grid.length.times do |i|
      x_count = 0
      grid.length.times do |j|
        x_count += 1 if grid[j][i] == 'X'
        return [(j + 1), i] if x_count > (grid.length - 2) && !grid.dig(j + 1, i).nil? && grid[j + 1][i].strip.empty?
      end
    end
    nil
  end

  def block_diagonal_win(grid)
    diagonal_x_count = 0
    cross_diagonal_x_count = 0
    grid.length.times.each do |i|
      diagonal_x_count += 1 if grid[i][i] == 'X'
      return [i + 1, i + 1] if diagonal_x_count > (grid.length - 2) && !grid.dig(i + 1, i + 1).nil? && grid[i + 1][i + 1].strip.empty?
      cross_diagonal_x_count += 1 if grid[i][grid.length - i - 1] == 'X'
      return [i+1, grid.length - i - 1 - 1] if cross_diagonal_x_count > (grid.length - 2) &&
          !grid.dig(i+1, grid.length - i - 1 - 1).nil? &&
          grid[i + 1][grid.length - i - 1 - 1].strip.empty?
    end
    nil
  end

  def random_move(grid)
    x_range = rand(0...grid.length)
    y_range = rand(0...grid.length)
    if grid[x_range][y_range].include?('X') || grid[x_range][y_range].include?('O')
      coordinates = random_move(grid)
    else
      coordinates = [x_range, y_range]
    end
    coordinates
  end
end


