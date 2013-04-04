require 'test_helper'

class KataControllerTest < ActionController::TestCase
  setup do
    @katum = kata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create katum" do
    assert_difference('Katum.count') do
      post :create, katum: { desc: @katum.desc, language: @katum.language, name: @katum.name, url: @katum.url }
    end

    assert_redirected_to katum_path(assigns(:katum))
  end

  test "should show katum" do
    get :show, id: @katum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @katum
    assert_response :success
  end

  test "should update katum" do
    put :update, id: @katum, katum: { desc: @katum.desc, language: @katum.language, name: @katum.name, url: @katum.url }
    assert_redirected_to katum_path(assigns(:katum))
  end

  test "should destroy katum" do
    assert_difference('Katum.count', -1) do
      delete :destroy, id: @katum
    end

    assert_redirected_to kata_path
  end
end
