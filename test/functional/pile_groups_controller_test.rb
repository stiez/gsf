require 'test_helper'

class PileGroupsControllerTest < ActionController::TestCase
  setup do
    @pile_group = pile_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pile_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pile_group" do
    assert_difference('PileGroup.count') do
      post :create, pile_group: @pile_group.attributes
    end

    assert_redirected_to pile_group_path(assigns(:pile_group))
  end

  test "should show pile_group" do
    get :show, id: @pile_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pile_group
    assert_response :success
  end

  test "should update pile_group" do
    put :update, id: @pile_group, pile_group: @pile_group.attributes
    assert_redirected_to pile_group_path(assigns(:pile_group))
  end

  test "should destroy pile_group" do
    assert_difference('PileGroup.count', -1) do
      delete :destroy, id: @pile_group
    end

    assert_redirected_to pile_groups_path
  end
end
