class Cell < ActiveRecord::Base
  validates :alive, :presence => true
end
