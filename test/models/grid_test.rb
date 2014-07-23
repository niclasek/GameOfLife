require 'test_helper'

class GridTest < ActiveSupport::TestCase
  test "Is ones name rut?" do
    assert grids(:one).name =="rut", "Assert that grid on is created with name rut"
    assert_instance_of(Grid, grids(:one))
  end

  test "Creating a grid" do
    grid = Grid.new
    assert grid.save, "Grid can be saved without name"
  end

  # test "the truth" do
  #   assert true
  # end
end
