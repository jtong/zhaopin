require 'test_helper'

class QuestionTemplatesControllerTest < ActionController::TestCase
  setup do
    @question_template = question_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:question_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question_template" do
    assert_difference('QuestionTemplate.count') do
      post :create, question_template: { js_file: @question_template.js_file, template_file: @question_template.template_file, view_file: @question_template.view_file }
    end

    assert_redirected_to question_template_path(assigns(:question_template))
  end

  test "should show question_template" do
    get :show, id: @question_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question_template
    assert_response :success
  end

  test "should update question_template" do
    put :update, id: @question_template, question_template: { js_file: @question_template.js_file, template_file: @question_template.template_file, view_file: @question_template.view_file }
    assert_redirected_to question_template_path(assigns(:question_template))
  end

  test "should destroy question_template" do
    assert_difference('QuestionTemplate.count', -1) do
      delete :destroy, id: @question_template
    end

    assert_redirected_to question_templates_path
  end
end
