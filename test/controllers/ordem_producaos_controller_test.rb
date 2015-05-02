require 'test_helper'

class OrdemProducaosControllerTest < ActionController::TestCase
  setup do
    @ordem_producao = ordem_producaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ordem_producaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ordem_producao" do
    assert_difference('OrdemProducao.count') do
      post :create, ordem_producao: { abrir_pasta: @ordem_producao.abrir_pasta, cliente_id: @ordem_producao.cliente_id, dados_variaveis: @ordem_producao.dados_variaveis, data_entrega: @ordem_producao.data_entrega, data_entrega_previsao: @ordem_producao.data_entrega_previsao, data_finalizacao: @ordem_producao.data_finalizacao, data_pdf: @ordem_producao.data_pdf, data_solicitacao: @ordem_producao.data_solicitacao, detalhes: @ordem_producao.detalhes, detalhes_entrega: @ordem_producao.detalhes_entrega, nota_fiscal: @ordem_producao.nota_fiscal, ordem_producao_status_id: @ordem_producao.ordem_producao_status_id, recibo: @ordem_producao.recibo, tipo: @ordem_producao.tipo, user_id: @ordem_producao.user_id }
    end

    assert_redirected_to ordem_producao_path(assigns(:ordem_producao))
  end

  test "should show ordem_producao" do
    get :show, id: @ordem_producao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ordem_producao
    assert_response :success
  end

  test "should update ordem_producao" do
    patch :update, id: @ordem_producao, ordem_producao: { abrir_pasta: @ordem_producao.abrir_pasta, cliente_id: @ordem_producao.cliente_id, dados_variaveis: @ordem_producao.dados_variaveis, data_entrega: @ordem_producao.data_entrega, data_entrega_previsao: @ordem_producao.data_entrega_previsao, data_finalizacao: @ordem_producao.data_finalizacao, data_pdf: @ordem_producao.data_pdf, data_solicitacao: @ordem_producao.data_solicitacao, detalhes: @ordem_producao.detalhes, detalhes_entrega: @ordem_producao.detalhes_entrega, nota_fiscal: @ordem_producao.nota_fiscal, ordem_producao_status_id: @ordem_producao.ordem_producao_status_id, recibo: @ordem_producao.recibo, tipo: @ordem_producao.tipo, user_id: @ordem_producao.user_id }
    assert_redirected_to ordem_producao_path(assigns(:ordem_producao))
  end

  test "should destroy ordem_producao" do
    assert_difference('OrdemProducao.count', -1) do
      delete :destroy, id: @ordem_producao
    end

    assert_redirected_to ordem_producaos_path
  end
end
