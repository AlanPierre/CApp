class PedidoVendasController < InheritedResources::Base
    load_and_authorize_resource  
    before_filter :authenticate_user!
       
        def index
        @status = PedidoVendaStatus.all  
         @vendedores = User.where(departamento_id: 1)
         @pedido_vendas  = PedidoVenda.includes(:user).filter(params.slice(:status,  :cliente_name, :vendedor, :search_with, :solicitacao_start_date, :solicitacao_end_date)).order("ID").paginate(:per_page => 50, :page => params[:page])

     end 
    
    def create  
        create! { collection_url }
        flash[:notice] = 'Pedido de venda salvo com sucesso!' 
    end
    
    def update  
        update! { edit_pedido_venda_path}
        flash[:notice] = 'Pedido de venda atualizado com sucesso!'

    end 
    
    def clone
        @pedido_venda_old = PedidoVenda.find(params[:id])
        @pedido_venda = @pedido_venda_old.dup
         @pedido_venda_old.pedido_venda_items.each do |pedido_venda|
            @pedido_venda.pedido_venda_items.new([
               :material_id => pedido_venda.material_id,
               :produto_id => pedido_venda.produto_id,
               :quantidade => pedido_venda.quantidade,
               :preco => pedido_venda.preco])
        end 
         render "new"
    end
    
    
    
  private
    def pedido_venda_params
      params.require(:pedido_venda).permit(:user_id, :cliente_id, :cliente_endereco_id, :data_solicitacao, :detalhes, :recibo, :nota_fiscal, :forma_pagamento_id, :pedido_venda_status_id,
          pedido_venda_items_attributes: [:id, :pedido_venda_id, :produto_id, :material_id, :valor, :desconto, :quantidade, :_destroy, :_update, :_create]) 
    end
    

end

 

       