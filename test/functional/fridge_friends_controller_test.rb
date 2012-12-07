require 'test_helper'

class FridgeFriendsControllerTest < ActionController::TestCase
  setup do
    @fridge_friend = fridge_friends(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fridge_friends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fridge_friend" do
    assert_difference('FridgeFriend.count') do
      post :create, fridge_friend: { friend_id: @fridge_friend.friend_id, user_id: @fridge_friend.user_id }
    end

    assert_redirected_to fridge_friend_path(assigns(:fridge_friend))
  end

  test "should show fridge_friend" do
    get :show, id: @fridge_friend
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fridge_friend
    assert_response :success
  end

  test "should update fridge_friend" do
    put :update, id: @fridge_friend, fridge_friend: { friend_id: @fridge_friend.friend_id, user_id: @fridge_friend.user_id }
    assert_redirected_to fridge_friend_path(assigns(:fridge_friend))
  end

  test "should destroy fridge_friend" do
    assert_difference('FridgeFriend.count', -1) do
      delete :destroy, id: @fridge_friend
    end

    assert_redirected_to fridge_friends_path
  end
end
