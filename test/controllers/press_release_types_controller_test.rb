require 'test_helper'

class PressReleaseTypesControllerTest < ActionController::TestCase
  setup do
    @press_release_type = press_release_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:press_release_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create press_release_type" do
    assert_difference('PressReleaseType.count') do
      post :create, press_release_type: { name: @press_release_type.name }
    end

    assert_redirected_to press_release_type_path(assigns(:press_release_type))
  end

  test "should show press_release_type" do
    get :show, id: @press_release_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @press_release_type
    assert_response :success
  end

  test "should update press_release_type" do
    patch :update, id: @press_release_type, press_release_type: { name: @press_release_type.name }
    assert_redirected_to press_release_type_path(assigns(:press_release_type))
  end

  test "should destroy press_release_type" do
    assert_difference('PressReleaseType.count', -1) do
      delete :destroy, id: @press_release_type
    end

    assert_redirected_to press_release_types_path
  end
end
