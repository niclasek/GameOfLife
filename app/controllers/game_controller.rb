class GameController < ApplicationController

  require 'benchmark'

  $m = 15
  $n = 15
  def start

    @grid_hash = HashGrid.new(:name => "smultron")
    @grid_hash.cells = Hash.new

    $m.times { |i|
      $n.times { |j|
        if rand(8) == 12
          @grid_hash.cells[i.to_s + " " + j.to_s] = 1
        else
          @grid_hash.cells[i.to_s + " " + j.to_s] = 0
        end
      }
    }
    @grid_hash.save


  end

  def next

    @grid_hash = HashGrid.where(name: 'smultron').last
    temp_hash = @grid_hash.cells.dup

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
  end

  def benchmark
  end

  def put_user_input
    @grid_hash = HashGrid.where(name: 'smultron').last
    temp_hash = Hash.new
    temp_hash = params[:game]
    temp_hash.each do |key, value|
      @grid_hash.cells[key] = temp_hash[key]
    end
    @grid_hash.save
  end

end

