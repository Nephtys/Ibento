require 'test_helper'

class TaskListsControllerTest < ActionController::TestCase
  setup do
    @task_list = task_lists(:one)
    @update = {:title => 'MyTaskList', :event=>Event.new(:title=>'Title')}
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_list" do
    assert_difference('TaskList.count') do
      post :create, :task_list => @update
    end

    assert_redirected_to task_list_path(assigns(:task_list))
  end

  test "should show task_list" do
    get :show, :id => @task_list.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @task_list.to_param
    assert_response :success
  end

  test "should update task_list" do
    put :update, :id => @task_list.to_param, :task_list => @update
    assert_redirected_to task_list_path(assigns(:task_list))
  end

  test "should destroy task_list" do
    assert_difference('TaskList.count', -1) do
      delete :destroy, :id => @task_list.to_param
    end

    assert_redirected_to task_lists_path
  end
end
