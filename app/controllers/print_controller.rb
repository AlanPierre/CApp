class PrintController < ApplicationController
  layout '../default/application_print'
    
    def cliente_print  
        @cliente = Cliente.find(params[:cliente_id])
         render '/clientes/print'
    end
    
    def pedido_venda_print  
        @pedido_venda = PedidoVenda.find(params[:pedido_venda_id])
        @pedido_venda_items = @pedido_venda.pedido_venda_items
        render '/pedido_vendas/print'
    end 
end