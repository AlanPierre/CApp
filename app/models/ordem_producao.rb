class OrdemProducao < ActiveRecord::Base
        attr_accessible :cliente_id, :cliente_endereco_id, :user_id, :ordem_producao_status_id, :data_solicitacao, :data_entrega_previsao, :data_pdf, :data_finalizacao, :data_entrega, :abrir_pasta, :recibo, :nota_fiscal, :dados_variaveis, :detalhes, :detalhes_entrega, :tipo,  :ordem_producao_items_attributes
     
   include Filterable
    scope :status, -> (status) {
        statuses = status.split(',')
        where ordem_producao_status_id: statuses }
    
    scope :vendedor, -> (vendedor) {
        vendedores = vendedor.split(',')
        where user_id: vendedores }
    
    
    scope :cliente_name, lambda { |cliente_name|
  where('LOWER(clientes.nome_fantasia) LIKE ?', "%#{cliente_name}%").joins(:cliente) 
        }
    
    scope :search_with, lambda { |search|
        where('id LIKE ?', search) 

        }

      scope :solicitacao_start_date,  -> (start_date) {
        start_date = start_date.to_s.gsub('/','-')
        start_date = start_date.to_date.strftime("%Y-%m-%d")
        where("data_solicitacao >= ?", start_date)
      }

      scope :solicitacao_end_date,  -> (end_date) {
        end_date = end_date.to_s.gsub('/','-')
        end_date = end_date.to_date.strftime("%Y-%m-%d")
        where("data_solicitacao <= ?", end_date)
      }
    
    validates_presence_of :cliente_id, :user_id, :data_solicitacao, :ordem_producao_status_id

    
    belongs_to :user
    belongs_to :cliente
    belongs_to :ordem_producao_status
    has_many :ordem_producao_items, :dependent => :destroy
    
    Tipos =  {"OP" => 1, "Amostra" => 2, "Re-impressão" => 3 }

    accepts_nested_attributes_for :ordem_producao_items, :reject_if => :all_blank, :allow_destroy => true
    
    def tipo_name
    Tipos['OP'] 
    end

end
