class UpdateCells3 < ActiveRecord::Migration
  def change
    change_column :cells, :alive, :boolean, :null => false
  end
end
