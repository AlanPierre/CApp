class Orcamento < ActiveRecord::Base
    attr_accessible :user_id, :cliente_id, :cliente_endereco_id, :id, :data_solicitacao, :data_aprovacao, :referencia, :condicoes, :orcamento_status_id,  :orcamento_items_attributes, :orcamento_contatos_attributes
    
    include Filterable
    scope :status, -> (status) {
        statuses = status.split(',')
        where orcamento_status_id: statuses }
    
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
    
    
    validates_presence_of :cliente_id, :user_id, :data_solicitacao, :orcamento_status_id

    belongs_to :user
    belongs_to :cliente
     belongs_to :cliente_endereco
    belongs_to :orcamento_status
    has_many :orcamento_items, :dependent => :destroy
    has_many :orcamento_contatos, :dependent => :destroy
 
    accepts_nested_attributes_for :orcamento_items, :reject_if => :all_blank, :allow_destroy => true
    accepts_nested_attributes_for :orcamento_contatos, :reject_if => :all_blank, :allow_destroy => true

    
 include PublicActivity::Model
 tracked :owner => proc {|controller, model| controller.current_user}


     def calculate_totals
        orcamento_items.map do |i|
            i.subtotal
        end.sum 
    end
     

     
end

 