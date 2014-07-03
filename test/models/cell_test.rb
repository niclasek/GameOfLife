require 'test_helper'

class CellTest < ActiveSupport::TestCase
  test "Is alive alive?" do
    assert cells(:alive).alive, "Assert that cell alive has been created as alive"
    assert_instance_of(Cell, cells(:alive))
  end

  test "Is dead dead?" do
    assert_not cells(:dead).alive, "Assert that cell dead has been created as dead"
    assert_instance_of(Cell, cells(:dead))
  end

  test "Creating a cell" do
    cell = Cell.new
    assert_not cell.save, "Cell with alive null should not be able to be saved"
  end

  test "Should not save cell without alive set" do
    cell = Cell.new
    assert_not cell.save, "Cell with alive null should not be able to be saved"
  end

  test "Should save cell with alive set" do
    cell = Cell.new
    cell.alive=true
    assert cell.save, "Cell with alive set should be able to be saved"
  end

  # test "the truth" do
  #   assert true
  # end
end
