class OrcamentosController < InheritedResources::Base
    load_and_authorize_resource  
    before_filter :authenticate_user!
    
    def index
        @status = OrcamentoStatus.all  
         @vendedores = User.where(departamento_id: 1)
         @orcamentos  = Orcamento.includes(:user).filter(params.slice(:status, :cliente_name, :vendedor, :search_with, :solicitacao_start_date, :solicitacao_end_date,:aprovacao_start_date, :aprovacao_end_date)).order("ID").paginate(:per_page => 50, :page => params[:page])

     end 
    
    
    def create  
        create! { collection_url } 
        flash[:notice] = 'Orçamento salvo com sucesso!' 
    end
    
    def update  
        update! { edit_orcamento_path}  
        flash[:notice] = 'Orçamento atualizado com sucesso!' 
    end
    
    def clone
        @orcamento_old = Orcamento.find(params[:id])
        @orcamento_old_items = @orcamento_old.orcamento_items
        @orcamento = Orcamento.create(@orcamento_old.attributes.merge(:id => ''))
        @orcamento.orcamento_items = @orcamento_old_items 
        redirect_to edit_orcamento_path(@orcamento)
        flash[:notice] = 'Orçamento duplicado!' 
    end
    
  private

    def orcamento_params
      params.require(:orcamento).permit(:user_id, :cliente_id, :cliente_endereco_id, :data_solicitacao, :data_aprovacao, :referencia, :condicoes, :orcamento_status_id,:cliente_endereco_id,
        orcamento_items_attributes: [:id, :orcamento_id, :produto_id, :material_id, :preco, :desconto, :quantidade, :descricao, :active, :_destroy],
        orcamento_contatos_attributes: [:id, :orcamento_id, :data_contato, :descricao, :_destroy])
    end
    

end

