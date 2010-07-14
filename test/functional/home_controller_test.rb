require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  setup do
    session[:id] = users(:john).id
  end
  test "should get show" do
    get :show
    assert_response :success
  end

end
