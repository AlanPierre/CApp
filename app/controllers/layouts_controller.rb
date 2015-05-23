class LayoutsController < InheritedResources::Base
    load_and_authorize_resource  
    before_filter :authenticate_user!
    
       def index
        @status = PedidoLayoutStatus.all  
         @layouts  = Layout.all.filter(params.slice(:status, :cliente_name,  :search_with, :solicitacao_start_date, :solicitacao_end_date,:aprovacao_start_date, :aprovacao_end_date)).order("ID").paginate(:per_page => 50, :page => params[:page])

     end 
    
    
    
    def create  
        create! { collection_url }
        flash[:notice] = 'Layout salvo com sucesso!'
    end
    
    def update  
        update! { edit_layout_path} 
        flash[:notice] = 'Layout atualizado com sucesso!' 
    end


        def clone
        @layout_old = layout.find(params[:id])
        @layout = layout.create(@layout_old.attributes.merge(:id => ''))
        redirect_to edit_layout_path(@layout)
        flash[:notice] = 'Layout duplicado!' 
    end
    
    
  private

    def layout_params
      params.require(:layout).permit(:name, :cliente_id, :data_aprovacao, :pedido_layout_status_id, :impressora_id, :impressora_config_id, :produto_id, :material_id, :codigo_barra_id, :digitos, :layout_acabamento_ids, :observacao)
    end
end




