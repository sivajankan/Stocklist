require 'test_helper'

class Stocklist1sControllerTest < ActionController::TestCase
  setup do
    @stocklist1 = stocklist1s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stocklist1s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stocklist1" do
    assert_difference('Stocklist1.count') do
      post :create, stocklist1: @stocklist1.attributes
    end

    assert_redirected_to stocklist1_path(assigns(:stocklist1))
  end

  test "should show stocklist1" do
    get :show, id: @stocklist1.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stocklist1.to_param
    assert_response :success
  end

  test "should update stocklist1" do
    put :update, id: @stocklist1.to_param, stocklist1: @stocklist1.attributes
    assert_redirected_to stocklist1_path(assigns(:stocklist1))
  end

  test "should destroy stocklist1" do
    assert_difference('Stocklist1.count', -1) do
      delete :destroy, id: @stocklist1.to_param
    end

    assert_redirected_to stocklist1s_path
  end
end
