require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create members" do
    assert_difference('Members.count') do
      post :create, :members => { }
    end

    assert_redirected_to members_path(assigns(:members))
  end

  test "should show members" do
    get :show, :id => members(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => members(:one).id
    assert_response :success
  end

  test "should update members" do
    put :update, :id => members(:one).id, :members => { }
    assert_redirected_to members_path(assigns(:members))
  end

  test "should destroy members" do
    assert_difference('Members.count', -1) do
      delete :destroy, :id => members(:one).id
    end

    assert_redirected_to members_path
  end
end
