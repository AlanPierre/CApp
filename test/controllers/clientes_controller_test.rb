require 'test_helper'

class ClientesControllerTest < ActionController::TestCase
  setup do
    @cliente = clientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cliente" do
    assert_difference('Cliente.count') do
      post :create, cliente: { cliente_faturamento_id: @cliente.cliente_faturamento_id, cliente_status_id: @cliente.cliente_status_id, cnpj: @cliente.cnpj, inscricao_estadual: @cliente.inscricao_estadual, inscricao_municipal: @cliente.inscricao_municipal, nome_fantasia: @cliente.nome_fantasia, notificao: @cliente.notificao, observacao: @cliente.observacao, razao_social: @cliente.razao_social, user_id: @cliente.user_id }
    end

    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should show cliente" do
    get :show, id: @cliente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cliente
    assert_response :success
  end

  test "should update cliente" do
    patch :update, id: @cliente, cliente: { cliente_faturamento_id: @cliente.cliente_faturamento_id, cliente_status_id: @cliente.cliente_status_id, cnpj: @cliente.cnpj, inscricao_estadual: @cliente.inscricao_estadual, inscricao_municipal: @cliente.inscricao_municipal, nome_fantasia: @cliente.nome_fantasia, notificao: @cliente.notificao, observacao: @cliente.observacao, razao_social: @cliente.razao_social, user_id: @cliente.user_id }
    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should destroy cliente" do
    assert_difference('Cliente.count', -1) do
      delete :destroy, id: @cliente
    end

    assert_redirected_to clientes_path
  end
end
