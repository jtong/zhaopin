require 'test_helper'

class MyExamsControllerTest < ActionController::TestCase
  setup do
    @my_exam = my_exams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_exams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_exam" do
    assert_difference('MyExam.count') do
      post :create, my_exam: { score: @my_exam.score, time_cost: @my_exam.time_cost, user_id: @my_exam.user_id }
    end

    assert_redirected_to my_exam_path(assigns(:my_exam))
  end

  test "should show my_exam" do
    get :show, id: @my_exam
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_exam
    assert_response :success
  end

  test "should update my_exam" do
    put :update, id: @my_exam, my_exam: { score: @my_exam.score, time_cost: @my_exam.time_cost, user_id: @my_exam.user_id }
    assert_redirected_to my_exam_path(assigns(:my_exam))
  end

  test "should destroy my_exam" do
    assert_difference('MyExam.count', -1) do
      delete :destroy, id: @my_exam
    end

    assert_redirected_to my_exams_path
  end
end
