require 'test_helper'

class LibriControllerTest < ActionController::TestCase
  setup do
    @libro = libri(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:libri)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create libro" do
    assert_difference('Libro.count') do
      post :create, libro: { titolo: @libro.titolo }
    end

    assert_redirected_to libro_path(assigns(:libro))
  end

  test "should show libro" do
    get :show, id: @libro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @libro
    assert_response :success
  end

  test "should update libro" do
    put :update, id: @libro, libro: { titolo: @libro.titolo }
    assert_redirected_to libro_path(assigns(:libro))
  end

  test "should destroy libro" do
    assert_difference('Libro.count', -1) do
      delete :destroy, id: @libro
    end

    assert_redirected_to libri_path
  end
end
