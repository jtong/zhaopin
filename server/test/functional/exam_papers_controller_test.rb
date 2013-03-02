require 'test_helper'

class ExamPapersControllerTest < ActionController::TestCase
  setup do
    @exam_paper = exam_papers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exam_papers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exam_paper" do
    assert_difference('ExamPaper.count') do
      post :create, exam_paper: { string: @exam_paper.string }
    end

    assert_redirected_to exam_paper_path(assigns(:exam_paper))
  end

  test "should show exam_paper" do
    get :show, id: @exam_paper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exam_paper
    assert_response :success
  end

  test "should update exam_paper" do
    put :update, id: @exam_paper, exam_paper: { string: @exam_paper.string }
    assert_redirected_to exam_paper_path(assigns(:exam_paper))
  end

  test "should destroy exam_paper" do
    assert_difference('ExamPaper.count', -1) do
      delete :destroy, id: @exam_paper
    end

    assert_redirected_to exam_papers_path
  end
end
