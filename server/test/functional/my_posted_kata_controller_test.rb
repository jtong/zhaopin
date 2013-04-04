require 'test_helper'

class MyPostedKataControllerTest < ActionController::TestCase
  setup do
    @my_posted_katum = my_posted_kata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_posted_kata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_posted_katum" do
    assert_difference('MyPostedKatum.count') do
      post :create, my_posted_katum: { desc: @my_posted_katum.desc, url: @my_posted_katum.url }
    end

    assert_redirected_to my_posted_katum_path(assigns(:my_posted_katum))
  end

  test "should show my_posted_katum" do
    get :show, id: @my_posted_katum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_posted_katum
    assert_response :success
  end

  test "should update my_posted_katum" do
    put :update, id: @my_posted_katum, my_posted_katum: { desc: @my_posted_katum.desc, url: @my_posted_katum.url }
    assert_redirected_to my_posted_katum_path(assigns(:my_posted_katum))
  end

  test "should destroy my_posted_katum" do
    assert_difference('MyPostedKatum.count', -1) do
      delete :destroy, id: @my_posted_katum
    end

    assert_redirected_to my_posted_kata_path
  end
end
