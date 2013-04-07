require 'test_helper'

class MyJobRolesControllerTest < ActionController::TestCase
  setup do
    @my_job_role = my_job_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_job_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_job_role" do
    assert_difference('MyJobRole.count') do
      post :create, my_job_role: { is_current: @my_job_role.is_current, name: @my_job_role.name }
    end

    assert_redirected_to my_job_role_path(assigns(:my_job_role))
  end

  test "should show my_job_role" do
    get :show, id: @my_job_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_job_role
    assert_response :success
  end

  test "should update my_job_role" do
    put :update, id: @my_job_role, my_job_role: { is_current: @my_job_role.is_current, name: @my_job_role.name }
    assert_redirected_to my_job_role_path(assigns(:my_job_role))
  end

  test "should destroy my_job_role" do
    assert_difference('MyJobRole.count', -1) do
      delete :destroy, id: @my_job_role
    end

    assert_redirected_to my_job_roles_path
  end
end
