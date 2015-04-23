class LayoutsController < InheritedResources::Base
    
    def create  
        create! { collection_url }  
    end
    
    def update  
        update! { edit_layout_path}  
    end


  private

    def layout_params
      params.require(:layout).permit(:name, :cliente_id, :data_aprovacao, :pedido_layout_status_id, :impressora_id, :impressora_config_id, :produto_id, :material_id, :codigo_barra_id, :digitos, :furo, :etiqueta, :porta_cracha, :observacao)
    end
end




