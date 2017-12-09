require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get sales" do
    get :sales
    assert_response :success
  end

end
