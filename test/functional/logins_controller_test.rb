require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  setup do
    @user = users(:john)
  end

  test "should get login page" do
    get :new
    assert_response :success
  end

  test "should login user" do
    post :create, :user => @user
    assert_equal @user.id, session[:id]
    assert_redirected_to home_path
  end

  test "should logout user" do
    post :create, :user => @user
    delete :destroy
    assert_nil session[:id]
    assert_redirected_to new_login_path
  end
end
