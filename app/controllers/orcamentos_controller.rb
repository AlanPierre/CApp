class OrcamentosController < InheritedResources::Base
 
    
    def index
        @vendedores = User.where(departamento_id: 1)
        @orcamentos_statuses = OrcamentoStatus.all    
         @orcamentos = Orcamento.filter(params.slice(:status, :vendedor)).paginate(:per_page => 50, :page => params[:page])
    end  
    
    def create  
        create! { collection_url }  
    end
    
    def update  
        update! { edit_orcamento_path}  
    end
    
  private

    def orcamento_params
      params.require(:orcamento).permit(:user_id, :cliente_id, :data_solicitacao, :data_aprovacao, :referencia, :condicoes, :orcamento_status_id,:cliente_endereco_id,
        orcamento_items_attributes: [:id, :orcamento_id, :produto_id, :material_id, :preco, :desconto, :quantidade, :descricao, :_destroy],
        orcamento_contatos_attributes: [:id, :orcamento_id, :data_contato, :descricao, :_destroy])
    end
end

