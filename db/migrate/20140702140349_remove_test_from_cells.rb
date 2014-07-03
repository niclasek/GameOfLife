class RemoveTestFromCells < ActiveRecord::Migration
  def change
    remove_column :cells, :test, :string
  end
end
