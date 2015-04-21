class PedidoVendasController < InheritedResources::Base

    
    def index
        @vendedores = User.where(departamento_id: 1)
        @pedido_venda_statuses = PedidoVendaStatus.all    
         @pedido_vendas = PedidoVenda.filter(params.slice(:status, :vendedor)).paginate(:per_page => 50, :page => params[:page])
    end  
    
    def create  
        create! { collection_url }  
    end
    
    def update  
        update! { edit_pedido_venda_path}  
    end 
    
         

  private
    def pedido_venda_params
      params.require(:pedido_venda).permit(:user_id, :cliente_id, :data_solicitacao, :detalhes, :recibo, :nota_fiscal, :forma_pagamento_id, :pedido_venda_status_id,
          pedido_venda_items_attributes: [:id, :pedido_venda_id, :produto_id, :material_id, :valor, :desconto, :quantidade, :_destroy, :_update, :_create]) 
    end
    

end

 

       