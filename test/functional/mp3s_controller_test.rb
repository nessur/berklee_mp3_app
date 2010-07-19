require 'test_helper'

class Mp3sControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mp3s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mp3" do
    assert_difference('Mp3.count') do
      post :create, :mp3 => { }
    end

    assert_redirected_to mp3_path(assigns(:mp3))
  end

  test "should show mp3" do
    get :show, :id => mp3s(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => mp3s(:one).to_param
    assert_response :success
  end

  test "should update mp3" do
    put :update, :id => mp3s(:one).to_param, :mp3 => { }
    assert_redirected_to mp3_path(assigns(:mp3))
  end

  test "should destroy mp3" do
    assert_difference('Mp3.count', -1) do
      delete :destroy, :id => mp3s(:one).to_param
    end

    assert_redirected_to mp3s_path
  end
end
