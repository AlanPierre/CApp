class Layout < ActiveRecord::Base
    attr_accessible :name, :cliente_id, :id, :data_aprovacao, :pedido_layout_status_id, :impressora_id, :impressora_config_id, :produto_id, :material_id, :codigo_barra_id, :digitos, :furo, :etiqueta, :porta_cracha, :observacao
    

    belongs_to :cliente
    belongs_to :pedido_layout_status
    belongs_to :impressora
    belongs_to :impressora_config
    belongs_to :produto
    belongs_to :material
    belongs_to :codigo_barra
    



end
