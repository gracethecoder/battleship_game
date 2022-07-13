class Board
  attr_reader(:size)
  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n*n
  end

  def [](position)
    return @grid[position[0]][position[1]]
  end

  def []= (position, value)
    row, col = position
    @grid[row][col] = value
  end

  def num_ships
    counter = 0

    @grid.each_with_index do |row, r|
      row.each_with_index do |col, c|
        if @grid[r][c] ==  :S
          counter +=1
        end
      end
    end
    return counter
  end


  def attack(position)
    # created the [] method on the board class, when references self, we are refering to the board class and use [] method created above
    if self[position] == :S
      self[position] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[position] = :X
      return false
    end
  end

  def place_random_ships
    total_ships = @size * 0.25

    while self.num_ships < total_ships
      random_row = rand(0...@grid.length)
      random_col = rand(0...@grid.length)
      pos = [random_row, random_col]
      self[pos]= :S
    end
  end


  def hidden_ships_grid
    @grid.map do |row|
      row.map do |ele|
        if ele == :S
          :N
        else
          ele
        end
      end
  end
end

def self.print_grid (arr)
  arr.each do |row|
    puts row.join(" ")
  end
end

def cheat
  Board.print_grid(@grid)
end

def print
  Board.print_grid(hidden_ships_grid)
end


end
