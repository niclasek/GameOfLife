require 'test_helper'

class GameControllerTest < ActionController::TestCase
  test "should get start" do
    get :start
    assert_response :success
    assert_not_nil assigns(:grid)
  end

  test "should get next" do
    get :next
    assert_response :success
  end

end
