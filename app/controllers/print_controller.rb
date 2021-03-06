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
    def orcamento_print  
        @orcamento = Orcamento.find(params[:orcamento_id])
        @orcamento_items = @orcamento.orcamento_items
        render '/orcamentos/print'
    end 
    
        def ordem_producao_print  
        @ordem_producao = OrdemProducao.find(params[:ordem_producao_id])
        @ordem_producao_items = @ordem_producao.ordem_producao_items
        render '/ordem_producao/print'
    end 
end
