class Cell < ActiveRecord::Base
  belongs_to :grid
  validates :m, :n, :presence => true

end
