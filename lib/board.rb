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

  private
  def initialize_grid
    @grid_length.times.each do |x|
      @grid.push(Array.new(@grid_length, ' '))
    end
  end
end