class UpdateCells5 < ActiveRecord::Migration
  def change
    change_column :cells, :alive, :string
  end
end
