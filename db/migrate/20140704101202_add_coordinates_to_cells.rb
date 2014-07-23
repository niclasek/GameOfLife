class AddCoordinatesToCells < ActiveRecord::Migration
  def change
    add_column :cells, :m, :integer, :null => false
    add_column :cells, :n, :integer, :null => false
  end
end
