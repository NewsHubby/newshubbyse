require 'test_helper'

class PressRoomsControllerTest < ActionController::TestCase
  setup do
    @press_room = press_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:press_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create press_room" do
    assert_difference('PressRoom.count') do
      post :create, press_room: { company_name: @press_room.company_name, founded: @press_room.founded, location: @press_room.location, phone: @press_room.phone, press_email: @press_room.press_email, twitter: @press_room.twitter, website: @press_room.website }
    end

    assert_redirected_to press_room_path(assigns(:press_room))
  end

  test "should show press_room" do
    get :show, id: @press_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @press_room
    assert_response :success
  end

  test "should update press_room" do
    patch :update, id: @press_room, press_room: { company_name: @press_room.company_name, founded: @press_room.founded, location: @press_room.location, phone: @press_room.phone, press_email: @press_room.press_email, twitter: @press_room.twitter, website: @press_room.website }
    assert_redirected_to press_room_path(assigns(:press_room))
  end

  test "should destroy press_room" do
    assert_difference('PressRoom.count', -1) do
      delete :destroy, id: @press_room
    end

    assert_redirected_to press_rooms_path
  end
end
