require 'test_helper'

class PlayerListsControllerTest < ActionController::TestCase
  setup do
    @player_list = player_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_list" do
    assert_difference('PlayerList.count') do
      post :create, player_list: { name: @player_list.name }
    end

    assert_redirected_to player_list_path(assigns(:player_list))
  end

  test "should show player_list" do
    get :show, id: @player_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player_list
    assert_response :success
  end

  test "should update player_list" do
    put :update, id: @player_list, player_list: { name: @player_list.name }
    assert_redirected_to player_list_path(assigns(:player_list))
  end

  test "should destroy player_list" do
    assert_difference('PlayerList.count', -1) do
      delete :destroy, id: @player_list
    end

    assert_redirected_to player_lists_path
  end
end
