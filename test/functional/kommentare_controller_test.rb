require 'test_helper'

class KommentareControllerTest < ActionController::TestCase
  setup do
    @kommentar = kommentare(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kommentare)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kommentar" do
    assert_difference('Kommentar.count') do
      post :create, kommentar: { autor: @kommentar.autor, derkommentar: @kommentar.derkommentar }
    end

    assert_redirected_to kommentar_path(assigns(:kommentar))
  end

  test "should show kommentar" do
    get :show, id: @kommentar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kommentar
    assert_response :success
  end

  test "should update kommentar" do
    put :update, id: @kommentar, kommentar: { autor: @kommentar.autor, derkommentar: @kommentar.derkommentar }
    assert_redirected_to kommentar_path(assigns(:kommentar))
  end

  test "should destroy kommentar" do
    assert_difference('Kommentar.count', -1) do
      delete :destroy, id: @kommentar
    end

    assert_redirected_to kommentare_path
  end
end
