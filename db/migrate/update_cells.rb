class CreateCells < ActiveRecord::Migration
  def change
    change_table :cells do |t|
      t.boolean :alive, null => false

    end
  end
end