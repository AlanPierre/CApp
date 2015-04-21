require 'test_helper'

class OrcamentosControllerTest < ActionController::TestCase
  setup do
    @orcamento = orcamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orcamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orcamento" do
    assert_difference('Orcamento.count') do
      post :create, orcamento: { cliente_id: @orcamento.cliente_id, condicoes: @orcamento.condicoes, data_aprovacao: @orcamento.data_aprovacao, data_solicitacao: @orcamento.data_solicitacao, orcamento_status_id: @orcamento.orcamento_status_id, referencia: @orcamento.referencia, user_id: @orcamento.user_id }
    end

    assert_redirected_to orcamento_path(assigns(:orcamento))
  end

  test "should show orcamento" do
    get :show, id: @orcamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orcamento
    assert_response :success
  end

  test "should update orcamento" do
    patch :update, id: @orcamento, orcamento: { cliente_id: @orcamento.cliente_id, condicoes: @orcamento.condicoes, data_aprovacao: @orcamento.data_aprovacao, data_solicitacao: @orcamento.data_solicitacao, orcamento_status_id: @orcamento.orcamento_status_id, referencia: @orcamento.referencia, user_id: @orcamento.user_id }
    assert_redirected_to orcamento_path(assigns(:orcamento))
  end

  test "should destroy orcamento" do
    assert_difference('Orcamento.count', -1) do
      delete :destroy, id: @orcamento
    end

    assert_redirected_to orcamentos_path
  end
end
