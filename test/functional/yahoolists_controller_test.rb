require 'test_helper'

class YahoolistsControllerTest < ActionController::TestCase
  setup do
    @yahoolist = yahoolists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yahoolists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yahoolist" do
    assert_difference('Yahoolist.count') do
      post :create, yahoolist: @yahoolist.attributes
    end

    assert_redirected_to yahoolist_path(assigns(:yahoolist))
  end

  test "should show yahoolist" do
    get :show, id: @yahoolist.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yahoolist.to_param
    assert_response :success
  end

  test "should update yahoolist" do
    put :update, id: @yahoolist.to_param, yahoolist: @yahoolist.attributes
    assert_redirected_to yahoolist_path(assigns(:yahoolist))
  end

  test "should destroy yahoolist" do
    assert_difference('Yahoolist.count', -1) do
      delete :destroy, id: @yahoolist.to_param
    end

    assert_redirected_to yahoolists_path
  end
end
