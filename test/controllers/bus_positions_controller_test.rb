require 'test_helper'

class BusPositionsControllerTest < ActionController::TestCase
  setup do
    @bus_position = bus_positions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bus_positions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bus_position" do
    assert_difference('BusPosition.count') do
      post :create, bus_position: { bus_id: @bus_position.bus_id, latitude: @bus_position.latitude, longitude: @bus_position.longitude, speed: @bus_position.speed, time: @bus_position.time }
    end

    assert_redirected_to bus_position_path(assigns(:bus_position))
  end

  test "should show bus_position" do
    get :show, id: @bus_position
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bus_position
    assert_response :success
  end

  test "should update bus_position" do
    patch :update, id: @bus_position, bus_position: { bus_id: @bus_position.bus_id, latitude: @bus_position.latitude, longitude: @bus_position.longitude, speed: @bus_position.speed, time: @bus_position.time }
    assert_redirected_to bus_position_path(assigns(:bus_position))
  end

  test "should destroy bus_position" do
    assert_difference('BusPosition.count', -1) do
      delete :destroy, id: @bus_position
    end

    assert_redirected_to bus_positions_path
  end
end
