require 'test_helper'

class ToppicksControllerTest < ActionController::TestCase
  setup do
    @toppick = toppicks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:toppicks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create toppick" do
    assert_difference('Toppick.count') do
      post :create, toppick: @toppick.attributes
    end

    assert_redirected_to toppick_path(assigns(:toppick))
  end

  test "should show toppick" do
    get :show, id: @toppick.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @toppick.to_param
    assert_response :success
  end

  test "should update toppick" do
    put :update, id: @toppick.to_param, toppick: @toppick.attributes
    assert_redirected_to toppick_path(assigns(:toppick))
  end

  test "should destroy toppick" do
    assert_difference('Toppick.count', -1) do
      delete :destroy, id: @toppick.to_param
    end

    assert_redirected_to toppicks_path
  end
end
