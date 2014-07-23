class Grid < ActiveRecord::Base
  has_many :cells

  def duplicate_with_associations
    new_grid = self.dup
    new_grid.save
    self.cells.each do |cell|
      new_grid.cells << cell.dup
    end
    return new_grid
  end

end
