class PedidoVendasController < InheritedResources::Base
    load_and_authorize_resource  
    before_filter :authenticate_user!
    
    def index
        @vendedores = User.where(departamento_id: 1)
        @pedido_venda_statuses = PedidoVendaStatus.all    
         @pedido_vendas = PedidoVenda.filter(params.slice(:status, :vendedor)).paginate(:per_page => 50, :page => params[:page])
    end  
    
    def create  
        create! { collection_url }
        flash[:notice] = 'Pedido de venda salvo com sucesso!' if @pedido_venda.update_attributes(params[:pedido_venda])
    end
    
    def update  
        update! { edit_pedido_venda_path}
        flash[:notice] = 'Pedido de venda atualizado com sucesso!' if @pedido_venda.update_attributes(params[:pedido_venda])

    end 
    
         

  private
    def pedido_venda_params
      params.require(:pedido_venda).permit(:user_id, :cliente_id, :cliente_endereco_id, :data_solicitacao, :detalhes, :recibo, :nota_fiscal, :forma_pagamento_id, :pedido_venda_status_id,
          pedido_venda_items_attributes: [:id, :pedido_venda_id, :produto_id, :material_id, :valor, :desconto, :quantidade, :_destroy, :_update, :_create]) 
    end
    

end

 

       