class CreateHashGrids < ActiveRecord::Migration
  def change
    create_table :hash_grids do |t|
      t.text :cells
      t.string :name

      t.timestamps
    end
  end
end
