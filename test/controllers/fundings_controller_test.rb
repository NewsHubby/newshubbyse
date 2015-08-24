require 'test_helper'

class FundingsControllerTest < ActionController::TestCase
  setup do
    @funding = fundings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fundings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create funding" do
    assert_difference('Funding.count') do
      post :create, funding: { date: @funding.date, investment_type: @funding.investment_type, name: @funding.name, press_room_id: @funding.press_room_id, sum: @funding.sum }
    end

    assert_redirected_to funding_path(assigns(:funding))
  end

  test "should show funding" do
    get :show, id: @funding
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @funding
    assert_response :success
  end

  test "should update funding" do
    patch :update, id: @funding, funding: { date: @funding.date, investment_type: @funding.investment_type, name: @funding.name, press_room_id: @funding.press_room_id, sum: @funding.sum }
    assert_redirected_to funding_path(assigns(:funding))
  end

  test "should destroy funding" do
    assert_difference('Funding.count', -1) do
      delete :destroy, id: @funding
    end

    assert_redirected_to fundings_path
  end
end
