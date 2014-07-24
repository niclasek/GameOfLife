class GameController < ApplicationController

  require 'benchmark'

  $m = 25
  $n = 50
  def start
=begin

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
=end

    Benchmark.bm(7) do |x|
      x.report("Creating the grid:")   {

        @grid_hash = HashGrid.new(:name => "smultron")
        @grid_hash.cells = Hash.new

        $m.times { |i|
          $n.times { |j|
            if rand(8) == 0
              @grid_hash.cells[i.to_s + " " + j.to_s] = 1
            else
              @grid_hash.cells[i.to_s + " " + j.to_s] = 0
            end
          }
        }
        @grid_hash.save
      }
    end

  end

  def next

=begin
    @grid_hallon = Grid.where(name: 'hallon').last
    @grid_temp = @grid_hallon.duplicate_with_associations
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
          end
        end

        if  @grid_hallon.cells.where(m: i, n:j).take.alive
          neighbours_alive -= 1
          #under and over-population
          if neighbours_alive < 2 || neighbours_alive > 3
            @grid_temp.cells.where(m: i, n:j).take.update(alive: 'false')
          end
        else
          #Reproduction
          if neighbours_alive == 3
            @grid_temp.cells.where(m: i, n:j).take.update(alive: 'true')
          end
        end
      }
    }
    @grid_hallon = @grid_temp
=end

    Benchmark.bm(7) do |x|
      x.report("Taking a step:")   {
        @grid_hash = HashGrid.where(name: 'smultron').last
        temp_hash = @grid_hash.cells.dup
        array = @grid_hash.cells.keys


        $m.times { |i|
          $n.times { |j|

            neighbours_alive = 0

            start_pos_i = i - 1 < 0 ? i : i-1
            start_pos_j = j - 1 < 0 ? j : j-1
            end_pos_i = i + 1 >= $m ? i : i+1
            end_pos_j = j + 1 >= $n ? j : j+1

            for row_num in start_pos_i..end_pos_i
              for col_num in start_pos_j..end_pos_j
                if @grid_hash.cells[row_num.to_s + " " + col_num.to_s] == 1
                  neighbours_alive += 1
                end
              end
            end

            if  @grid_hash.cells[i.to_s + " " + j.to_s] == 1
              neighbours_alive -= 1
              #under and over-population
              if neighbours_alive < 2 || neighbours_alive > 3
                temp_hash[i.to_s + " " + j.to_s] = 0
              end
            else
              #Reproduction
              if neighbours_alive == 3
                temp_hash[i.to_s + " " + j.to_s] = 1
              end
            end
          }
        }
        @grid_hash.cells = temp_hash.dup
        @grid_hash.save
      }
    end
  end







  def benchmark

    n = 5000

    Benchmark.bm(7) do |x|
      x.report("Creating the grid:")   {
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
      }

      x.report("Duplicate the grid:") {
        @grid_hallon = Grid.where(name: 'hallon').last
        @grid_temp = @grid_hallon.duplicate_with_associations
        @grid_temp.save
      }


      x.report("Visiting all the neighbours (and updating the cells):")  {
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
              end
            end

            if  @grid_hallon.cells.where(m: i, n:j).take.alive
              neighbours_alive -= 1
              #under and over-population
              if neighbours_alive < 2 || neighbours_alive > 3
                @grid_temp.cells.where(m: i, n:j).take.update(alive: 'false')
              end
            else
              #Reproduction
              if neighbours_alive == 3
                @grid_temp.cells.where(m: i, n:j).take.update(alive: 'true')
              end
            end
          }
        }

      }
    end

  end


end

