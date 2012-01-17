require 'test_helper'

class StocklistsControllerTest < ActionController::TestCase
  setup do
    @stocklist = stocklists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stocklists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stocklist" do
    assert_difference('Stocklist.count') do
      post :create, stocklist: @stocklist.attributes
    end

    assert_redirected_to stocklist_path(assigns(:stocklist))
  end

  test "should show stocklist" do
    get :show, id: @stocklist.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stocklist.to_param
    assert_response :success
  end

  test "should update stocklist" do
    put :update, id: @stocklist.to_param, stocklist: @stocklist.attributes
    assert_redirected_to stocklist_path(assigns(:stocklist))
  end

  test "should destroy stocklist" do
    assert_difference('Stocklist.count', -1) do
      delete :destroy, id: @stocklist.to_param
    end

    assert_redirected_to stocklists_path
  end
end
