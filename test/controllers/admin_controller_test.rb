require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get masterviewer" do
    get :masterviewer
    assert_response :success
  end

end
