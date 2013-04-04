require 'test_helper'

class MyPostedHomeworksControllerTest < ActionController::TestCase
  setup do
    @my_posted_homework = my_posted_homeworks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_posted_homeworks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_posted_homework" do
    assert_difference('MyPostedHomework.count') do
      post :create, my_posted_homework: { desc: @my_posted_homework.desc, url: @my_posted_homework.url }
    end

    assert_redirected_to my_posted_homework_path(assigns(:my_posted_homework))
  end

  test "should show my_posted_homework" do
    get :show, id: @my_posted_homework
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_posted_homework
    assert_response :success
  end

  test "should update my_posted_homework" do
    put :update, id: @my_posted_homework, my_posted_homework: { desc: @my_posted_homework.desc, url: @my_posted_homework.url }
    assert_redirected_to my_posted_homework_path(assigns(:my_posted_homework))
  end

  test "should destroy my_posted_homework" do
    assert_difference('MyPostedHomework.count', -1) do
      delete :destroy, id: @my_posted_homework
    end

    assert_redirected_to my_posted_homeworks_path
  end
end
