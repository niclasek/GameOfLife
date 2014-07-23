class UpdateCells4 < ActiveRecord::Migration
  def change
    change_column :cells, :alive, :boolean
  end
end
