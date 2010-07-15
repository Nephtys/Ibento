require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    session[:id] = users(:john).id
    @event = Event.find(:first)
  end
  test "should get show" do
    get :show, :id => @event.id
    assert_response :success
  end

end
