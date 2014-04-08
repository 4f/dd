require 'test_helper'

class AlbomsControllerTest < ActionController::TestCase
  setup do
    @albom = alboms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alboms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create albom" do
    assert_difference('Albom.count') do
      post :create, albom: { text: @albom.text, title: @albom.title, tumba: @albom.tumba }
    end

    assert_redirected_to albom_path(assigns(:albom))
  end

  test "should show albom" do
    get :show, id: @albom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @albom
    assert_response :success
  end

  test "should update albom" do
    put :update, id: @albom, albom: { text: @albom.text, title: @albom.title, tumba: @albom.tumba }
    assert_redirected_to albom_path(assigns(:albom))
  end

  test "should destroy albom" do
    assert_difference('Albom.count', -1) do
      delete :destroy, id: @albom
    end

    assert_redirected_to alboms_path
  end
end
