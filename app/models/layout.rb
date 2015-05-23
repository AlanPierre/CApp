class Layout < ActiveRecord::Base
    attr_accessible :name, :cliente_id, :id, :data_aprovacao, :pedido_layout_status_id, :impressora_id, :impressora_config_id, :produto_id, :material_id, :codigo_barra_id, :digitos, :observacao, :layout_acabamento_ids
     
    include Filterable
    
    scope :status, -> (status) {
        statuses = status.split(',')
        where pedido_layout_status_id: statuses }
    
    
    scope :cliente_name, lambda { |cliente_name|
  where('LOWER(clientes.nome_fantasia) LIKE ?', "%#{cliente_name}%").joins(:cliente) 
        }
    
    scope :search_with, lambda { |search|
        where('id LIKE ?', search) 

        }

     scope :aprovacao_start_date,  -> (start_date) {
        start_date = start_date.to_s.gsub('/','-')
        start_date = start_date.to_date.strftime("%Y-%m-%d")
        where("data_aprovacao >= ?", start_date)
      }
    
      scope :aprovacao_end_date,  -> (end_date) {
        end_date = end_date.to_s.gsub('/','-')
        end_date = end_date.to_date.strftime("%Y-%m-%d")
        where("data_aprovacao <= ?", end_date)
      }
    
        validates_presence_of :name, :cliente_id, :produto_id, :data_aprovacao


    belongs_to :cliente
    belongs_to :pedido_layout_status
    belongs_to :impressora
    belongs_to :impressora_config
    belongs_to :produto
    belongs_to :material
    belongs_to :codigo_barra
    has_and_belongs_to_many :layout_acabamentos
    




end
