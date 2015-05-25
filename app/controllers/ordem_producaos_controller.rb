class OrdemProducaosController < InheritedResources::Base
    load_and_authorize_resource  
    before_filter :authenticate_user!
        
       def index
        @status = OrdemProducaoStatus.all  
         @vendedores = User.where(departamento_id: 1)
         @ordem_producaos  = OrdemProducao.includes(:user).filter(params.slice(:status,  :cliente_name, :vendedor, :search_with, :solicitacao_start_date, :solicitacao_end_date)).order("ID").paginate(:per_page => 50, :page => params[:page])

     end 
    
    
        
    def create  
        create! { collection_url }
        flash[:notice] = 'Ordem de produção salva com sucesso!' 
    end
    
            
    def edit
        @ordem_producao = OrdemProducao.find(params[:id])
        @produtos = []
        if @ordem_producao.tipo != "1"
           @produtos = Produto.all
        else
            cliente = Cliente.find(@ordem_producao.cliente_id)
            @cliente_estoques = cliente.cliente_estoques.group(:produto_id)
            @cliente_estoques.each do |prod|
                tprodutos = Produto.where("id = ?", prod.produto_id)
                @produtos += tprodutos if tprodutos
            end
        end   
    end
    

    
    def update
        @ordem_producao = OrdemProducao.find(params[:id])
        @produtos = []
        if @ordem_producao.tipo != "1"
           @produtos = Produto.all
        else
            cliente = Cliente.find(@ordem_producao.cliente_id)
            @cliente_estoques = cliente.cliente_estoques.group(:produto_id)
            @cliente_estoques.each do |prod|
                tprodutos = Produto.where("id = ?", prod.produto_id)
                @produtos += tprodutos if tprodutos
            end
        end 
        update! { edit_ordem_producao_path}
        flash[:error] = 'Ordem de produção atualizada com sucesso!'
    end 

    
    def update_produtos_op
        @produtos = []
        if params[:tipo_id] != "1"
           @produtos = Produto.all
        else
            cliente = Cliente.find(params[:cliente_id])
            @cliente_estoques = cliente.cliente_estoques.group(:produto_id)
            @cliente_estoques.each do |prod|
                tprodutos = Produto.where("id = ?", prod.produto_id)
                @produtos += tprodutos if tprodutos
            end
        end
        respond_to do |format|
            format.js
        end 
    end
    
        
    def clone
        @ordem_producao_old = OrdemProducao.find(params[:id])
        @ordem_producao = @ordem_producao_old.dup
         @ordem_producao_old.ordem_producao_items.each do |ordem_producao|
            @ordem_producao.ordem_producao_items.new([
               :material_id => ordem_producao.material_id,
               :produto_id => ordem_producao.produto_id,
               :quantidade => ordem_producao.quantidade])
        end 
         render "new"
    end
    

    
  private

    def ordem_producao_params
      params.require(:ordem_producao).permit(:cliente_id, :cliente_endereco_id, :user_id, :ordem_producao_status_id, :data_solicitacao, :data_entrega_previsao, :data_pdf, :data_finalizacao, :data_entrega, :abrir_pasta, :recibo, :nota_fiscal, :dados_variaveis, :detalhes, :detalhes_entrega, :tipo, 
          ordem_producao_items_attributes: [:id, :ordem_producao_id, :user_id, :produto_id, :material_id, :layout_id, :quantidade, :perdas_quantidade, :_destroy, :_update, :_create, layout_acabamento_ids:[]])
    end
end

