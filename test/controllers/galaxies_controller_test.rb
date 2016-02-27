require 'test_helper'

class GalaxiesControllerTest < ActionController::TestCase
  setup do
    @galaxy = galaxies(:Galaxy_1)
    @user = users(:User_1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:galaxies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create galaxy" do
    assert_difference('Galaxy.count') do
      post :create, galaxy: {}
    end

    assert_redirected_to galaxy_path(assigns(:galaxy))
  end

  test "should show galaxy" do
    get :show, id: @galaxy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @galaxy
    assert_response :success
  end

  test "should_add_friend" do
    get :add_friend, friend_id: @user, friend_email: @user
    assert_response :success
  end

  test "should update galaxy" do
    patch :update, id: @galaxy, galaxy: {}
    assert_redirected_to galaxy_path(assigns(:galaxy))
  end

  test "should destroy galaxy" do
    assert_difference('Galaxy.count', -1) do
      delete :destroy, id: @galaxy
    end

    assert_redirected_to galaxies_path
  end
end
