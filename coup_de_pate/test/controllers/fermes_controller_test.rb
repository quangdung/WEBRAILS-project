require 'test_helper'

class FermesControllerTest < ActionController::TestCase
  setup do
    @ferme = fermes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fermes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ferme" do
    assert_difference('Ferme.count') do
      post :create, ferme: { adresse: @ferme.adresse, gerant_id: @ferme.gerant_id, nom: @ferme.nom }
    end

    assert_redirected_to ferme_path(assigns(:ferme))
  end

  test "should show ferme" do
    get :show, id: @ferme
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ferme
    assert_response :success
  end

  test "should update ferme" do
    patch :update, id: @ferme, ferme: { adresse: @ferme.adresse, gerant_id: @ferme.gerant_id, nom: @ferme.nom }
    assert_redirected_to ferme_path(assigns(:ferme))
  end

  test "should destroy ferme" do
    assert_difference('Ferme.count', -1) do
      delete :destroy, id: @ferme
    end

    assert_redirected_to fermes_path
  end
end
