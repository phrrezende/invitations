require 'test_helper'

class ConvitesControllerTest < ActionController::TestCase
  setup do
    @convite = convites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:convites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create convite" do
    assert_difference('Convite.count') do
      post :create, convite: { convidado_id: @convite.convidado_id, data_entrega: @convite.data_entrega }
    end

    assert_redirected_to convite_path(assigns(:convite))
  end

  test "should show convite" do
    get :show, id: @convite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @convite
    assert_response :success
  end

  test "should update convite" do
    patch :update, id: @convite, convite: { convidado_id: @convite.convidado_id, data_entrega: @convite.data_entrega }
    assert_redirected_to convite_path(assigns(:convite))
  end

  test "should destroy convite" do
    assert_difference('Convite.count', -1) do
      delete :destroy, id: @convite
    end

    assert_redirected_to convites_path
  end
end
