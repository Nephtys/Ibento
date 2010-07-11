require 'test_helper'

class ParticipantsControllerTest < ActionController::TestCase
  setup do
    @participant = participants(:one)
    @update = {:status => 1, :event => events(:one), :user => users(:john)}
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:participants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participant" do
    assert_difference('Participant.count') do
      post :create, :participant => @update
    end

    assert_redirected_to participant_path(assigns(:participant))
  end

  test "should show participant" do
    get :show, :id => @participant.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @participant.to_param
    assert_response :success
  end

  test "should update participant" do
    put :update, :id => @participant.to_param, :participant => @update
    assert_redirected_to participant_path(assigns(:participant))
  end

  test "should destroy participant" do
    assert_difference('Participant.count', -1) do
      delete :destroy, :id => @participant.to_param
    end

    assert_redirected_to participants_path
  end
end
