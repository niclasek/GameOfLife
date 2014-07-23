class GameController < ApplicationController

  $m = 20
  $n = 20
  def start

    @grid_hallon = Grid.new(:name => "hallon")
    @grid_hallon.save
    $m.times { |i|
      $n.times { |j|
        if rand(8) == 0
          @grid_hallon.cells.create(:alive => true, :m => i, :n => j)
        else
          @grid_hallon.cells.create(:alive => false, :m => i, :n => j)
        end
      }
    }
    cell1 = @grid_hallon.cells.create(:alive => true, :m => 1, :n => 1)
    cell2 = @grid_hallon.cells.create(:alive => false, :m => 2, :n => 2)

    apa = Cell.find_by! m: '1', n: '1'
    boll = Cell.where(m: '1', n:'1').first.alive
    boll2 = @grid_hallon.cells.where(m: '1', n:'1').take

    #To get a specific cell
    jojjo = @grid_hallon.cells.find_by! m: '1', n:'1'

    cell3 = Cell.new(:alive => true, :m => 1, :n => 1)
    apple = cell3.alive

puts "h"

  end

  def next

    @grid_hallon = Grid.where(name: 'hallon').last
    boll2 = @grid_hallon.cells.where(m: '1', n:'1').take
    @grid_temp = @grid_hallon.duplicate_with_associations
    #@grid_temp = @grid_hallon.deep_dup

    #@grid_temp = Grid.new(:name => "temp")
    @grid_temp.save



    $m.times { |i|
      $n.times { |j|

        neighbours_alive = 0

        start_pos_i = i - 1 < 0 ? i : i-1
        start_pos_j = j - 1 < 0 ? j : j-1
        end_pos_i = i + 1 >= $m ? i : i+1
        end_pos_j = j + 1 >= $n ? j : j+1

        for row_num in start_pos_i..end_pos_i
          for col_num in start_pos_j..end_pos_j
            if @grid_hallon.cells.where(m: row_num, n:col_num).take.alive
              neighbours_alive += 1
            end

            puts 'hej'

          end
        end

        if  @grid_hallon.cells.where(m: i, n:j).take.alive
          neighbours_alive -= 1
          #under and over-population
          if neighbours_alive < 2 || neighbours_alive > 3
            @grid_temp.cells.where(m: i, n:j).take.update(alive: 'false')
          end
          puts 'hej'
        else
          #Reproduction
          if neighbours_alive == 3
            @grid_temp.cells.where(m: i, n:j).take.update(alive: 'true')
          end

        end

        puts 'hej'


        # if @grid_hallon.cells.where(m: i, n:j).take.alive
        #   puts 'alive'
        # else
        #   @grid_hallon.cells.where(m: i, n:j).take.update(alive: 'true')
        #
        #   puts 'dead'
        # end

      }
    }
    @grid_hallon = @grid_temp


  end
end









=begin
  @@m,@@n = 20,40


    # m = rows
    # n = columns

    new_cell = Proc.new {
      if rand(2) == 0
        Cell.new(:alive => true)
      else
        Cell.new(:alive => false)
      end
    }
    @grid = Array.new(@@m) { Array.new(@@n, &new_cell) }
    # @grid.each {|a| a.each { |mn| puts mn.alive } }


    plus_one = Proc.new { |n| n +1 }
    @nr_grid = Array.new(@@m) { Array.new(@@n, &plus_one) }

    def test
      puts "hej"
    end

    # Testing
    cell = Cell.new(:alive => true)
    grid_t1 = Array.new(@@m) { Array.new(@@n) {rand(6)} }
    is_alive = @grid[1][1].alive

    # Testing with an array
    # array = Array.new(n, &new_cell)
    # array.each {|mn| puts mn.alive }




  # for statement for iterating the grid
    for m in 0...grid.length
      for n in 0...grid[m].length
          puts grid[m][n].alive
          puts "hej"
      end

    end


    #puts is_alive
    # puts grid

=end






=begin
    new_cell = Proc.new {
      if rand(5) == 0
        Cell.new(:alive => true)
      else
        Cell.new(:alive => false)
      end
    }

    @grid = Array.new(@@m) { Array.new(@@n, &new_cell) }
    # @grid[1][1].alive


    for m in 0...@@grid_cv.length
      for n in 0...@@grid_cv[m].length
        neighbours = 0

          for a in m-1...m+1
            for b in n-1...n+1
              if @@grid_cv[a][b].alive
                neighbours= neighbours +1
              end
            end
          end

        if neighbours > 5
          @@grid_cv[m][n].alive = false
        end

      end
    end
  @grid = @@grid_cv
=end