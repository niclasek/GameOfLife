class UpdateCells < ActiveRecord::Migration
  def change
    add_column :cells, :test, :string
  end
end
