require 'test_helper'

class LayoutsControllerTest < ActionController::TestCase
  setup do
    @layout = layouts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:layouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create layout" do
    assert_difference('Layout.count') do
      post :create, layout: { cliente_id: @layout.cliente_id, codigo_barra_id: @layout.codigo_barra_id, data_aprovacao: @layout.data_aprovacao, digitos: @layout.digitos, etiqueta: @layout.etiqueta, furo: @layout.furo, impressora_config_id: @layout.impressora_config_id, impressora_id: @layout.impressora_id, material_id: @layout.material_id, name: @layout.name, observacao: @layout.observacao, pedido_layout_status_id: @layout.pedido_layout_status_id, porta_cracha: @layout.porta_cracha, produto_id: @layout.produto_id }
    end

    assert_redirected_to layout_path(assigns(:layout))
  end

  test "should show layout" do
    get :show, id: @layout
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @layout
    assert_response :success
  end

  test "should update layout" do
    patch :update, id: @layout, layout: { cliente_id: @layout.cliente_id, codigo_barra_id: @layout.codigo_barra_id, data_aprovacao: @layout.data_aprovacao, digitos: @layout.digitos, etiqueta: @layout.etiqueta, furo: @layout.furo, impressora_config_id: @layout.impressora_config_id, impressora_id: @layout.impressora_id, material_id: @layout.material_id, name: @layout.name, observacao: @layout.observacao, pedido_layout_status_id: @layout.pedido_layout_status_id, porta_cracha: @layout.porta_cracha, produto_id: @layout.produto_id }
    assert_redirected_to layout_path(assigns(:layout))
  end

  test "should destroy layout" do
    assert_difference('Layout.count', -1) do
      delete :destroy, id: @layout
    end

    assert_redirected_to layouts_path
  end
end
