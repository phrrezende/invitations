require 'test_helper'

class ConvidadosControllerTest < ActionController::TestCase
  setup do
    @convidado = convidados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:convidados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create convidado" do
    assert_difference('Convidado.count') do
      post :create, convidado: { bairro: @convidado.bairro, cidade: @convidado.cidade, conjuge: @convidado.conjuge, descricao: @convidado.descricao, endereco: @convidado.endereco, nome: @convidado.nome }
    end

    assert_redirected_to convidado_path(assigns(:convidado))
  end

  test "should show convidado" do
    get :show, id: @convidado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @convidado
    assert_response :success
  end

  test "should update convidado" do
    patch :update, id: @convidado, convidado: { bairro: @convidado.bairro, cidade: @convidado.cidade, conjuge: @convidado.conjuge, descricao: @convidado.descricao, endereco: @convidado.endereco, nome: @convidado.nome }
    assert_redirected_to convidado_path(assigns(:convidado))
  end

  test "should destroy convidado" do
    assert_difference('Convidado.count', -1) do
      delete :destroy, id: @convidado
    end

    assert_redirected_to convidados_path
  end
end
