class GameController < ApplicationController
  def start
    # m = rows
    # n = columns
    m,n = 30,30
    new_cell = Proc.new {
      if rand(2) == 0
        Cell.new(:alive => true)
      else
        Cell.new(:alive => false)
      end
    }
    @grid = Array.new(m) { Array.new(n, &new_cell) }
    @grid.each {|a| a.each { |mn| puts mn.alive } }

    plus_one = Proc.new { |n| n +1 }
    @nr_grid = Array.new(m) { Array.new(n, &plus_one) }


    # Testing
    cell = Cell.new(:alive => true)
    grid_t1 = Array.new(m) { Array.new(n) {rand(6)} }
    is_alive = @grid[1][1].alive

    # Testing with an array
    # array = Array.new(n, &new_cell)
    # array.each {|mn| puts mn.alive }


=begin
  # for statement for iterating the grid
    for m in 0...grid.length
      for n in 0...grid[m].length
          puts grid[m][n].alive
          puts "hej"
      end

    end
=end

    #puts is_alive
    # puts grid

  end

  def next
  end
end
