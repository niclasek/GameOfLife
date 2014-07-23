class AddGridIdToCell < ActiveRecord::Migration
  def change
    add_column :cells, :grid_id, :integer
  end
end
