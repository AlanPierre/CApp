class LayoutsController < InheritedResources::Base
    load_and_authorize_resource  
    before_filter :authenticate_user!
    
    def create  
        create! { collection_url }
        flash[:notice] = 'Layout salvo com sucesso!' if @layout.update_attributes(params[:layout])
    end
    
    def update  
        update! { edit_layout_path} 
        flash[:notice] = 'Layout atualizado com sucesso!' if @layout.update_attributes(params[:layout])
    end


  private

    def layout_params
      params.require(:layout).permit(:name, :cliente_id, :data_aprovacao, :pedido_layout_status_id, :impressora_id, :impressora_config_id, :produto_id, :material_id, :codigo_barra_id, :digitos, :layout_acabamento_ids, :observacao)
    end
end




