class DefaultController < ApplicationController
      respond_to :json

      def index 
        render :index
      end
    
    def access_denied 
        render :access_denied
      end
    
    
    
      def update_produtos        
        produto = Produto.find(params[:produto_id])
              respond_to do |format|
            format.json { render :json => produto.materials.where(active: true)}
        end
      end
    

    
      def update_materials_op
        @materials = []
        if params[:tipo_id] != "1"
            produto = Produto.find(params[:produto_id])
           @materials = produto.materials.where(active: true)        

        else
            cliente = Cliente.find(params[:cliente_id])
            produto = Produto.find(params[:produto_id])
            @cliente_estoques = cliente.cliente_estoques
            @cliente_estoques.each do |materials|
                if produto.id == materials.produto_id
                tmaterials = produto.materials.where("id = ?", materials.material_id)
                @materials += tmaterials if tmaterials
                end
                
            end
        end
        
        respond_with(@materials) 
    end
    
    
    def update_impressora_configs        
        impressora = Impressora.find(params[:impressora_id])
              respond_to do |format|
            format.json { render :json => impressora.impressora_configs.where(active: true)}
        end
      end

      def update_cidades
        estado = Estado.find(params[:estado_id])
        respond_to do |format|
            format.html {render :json => estado.cidades}
            format.json { render :json => estado.cidades }
        end
      end
        
     def busca_endereco
         cliente = Cliente.find(params[:cliente_id])
          respond_to do |format|
            format.html {render :json => cliente.cliente_enderecos}
            format.json { render :json => cliente.cliente_enderecos }
        end
      end
    
    def update_item_descricao
        item_descricao = OrcamentoItemDescricao.find(params[:descricao_id])
        respond_to do |format|
            format.html {render :json => item_descricao}
            format.json { render :json => item_descricao}
        end
    end


    def gerar_venda
        @orcamento = Orcamento.find(params[:orcamento_id])
        @orcamento_items = @orcamento.orcamento_items 
        pedido_venda = PedidoVenda.create(:cliente_id => @orcamento.cliente_id, :user_id => @orcamento.user_id)    
        @orcamento_items.each do |orcamento_item|
            pedido_venda.pedido_venda_items.create([:material_id => orcamento_item.material_id,:produto_id => orcamento_item.produto_id, :quantidade => orcamento_item.quantidade, :preco => orcamento_item.preco])
        end 
        redirect_to edit_pedido_venda_path(pedido_venda)
    end
    
    
    
    

end
