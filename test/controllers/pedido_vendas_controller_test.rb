require 'test_helper'

class PedidoVendasControllerTest < ActionController::TestCase
  setup do
    @pedido_venda = pedido_vendas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pedido_vendas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pedido_venda" do
    assert_difference('PedidoVenda.count') do
      post :create, pedido_venda: { cliente_id: @pedido_venda.cliente_id, data_solicitacao: @pedido_venda.data_solicitacao, detalhes: @pedido_venda.detalhes, forma_pagamento_id: @pedido_venda.forma_pagamento_id, nota_fiscal: @pedido_venda.nota_fiscal, pedido_venda_status_id: @pedido_venda.pedido_venda_status_id, recibo: @pedido_venda.recibo, user_id: @pedido_venda.user_id }
    end

    assert_redirected_to pedido_venda_path(assigns(:pedido_venda))
  end

  test "should show pedido_venda" do
    get :show, id: @pedido_venda
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pedido_venda
    assert_response :success
  end

  test "should update pedido_venda" do
    patch :update, id: @pedido_venda, pedido_venda: { cliente_id: @pedido_venda.cliente_id, data_solicitacao: @pedido_venda.data_solicitacao, detalhes: @pedido_venda.detalhes, forma_pagamento_id: @pedido_venda.forma_pagamento_id, nota_fiscal: @pedido_venda.nota_fiscal, pedido_venda_status_id: @pedido_venda.pedido_venda_status_id, recibo: @pedido_venda.recibo, user_id: @pedido_venda.user_id }
    assert_redirected_to pedido_venda_path(assigns(:pedido_venda))
  end

  test "should destroy pedido_venda" do
    assert_difference('PedidoVenda.count', -1) do
      delete :destroy, id: @pedido_venda
    end

    assert_redirected_to pedido_vendas_path
  end
end
