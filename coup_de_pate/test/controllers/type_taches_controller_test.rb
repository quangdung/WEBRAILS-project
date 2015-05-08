require 'test_helper'

class TypeTachesControllerTest < ActionController::TestCase
  setup do
    @type_tach = type_taches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_taches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_tach" do
    assert_difference('TypeTache.count') do
      post :create, type_tach: { nom: @type_tach.nom }
    end

    assert_redirected_to type_tach_path(assigns(:type_tach))
  end

  test "should show type_tach" do
    get :show, id: @type_tach
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_tach
    assert_response :success
  end

  test "should update type_tach" do
    patch :update, id: @type_tach, type_tach: { nom: @type_tach.nom }
    assert_redirected_to type_tach_path(assigns(:type_tach))
  end

  test "should destroy type_tach" do
    assert_difference('TypeTache.count', -1) do
      delete :destroy, id: @type_tach
    end

    assert_redirected_to type_taches_path
  end
end
