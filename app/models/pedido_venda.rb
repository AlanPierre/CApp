class PedidoVenda < ActiveRecord::Base

    attr_accessible :user_id, :id, :cliente_endereco_id, :cliente_id, :data_solicitacao, :detalhes,  :recibo, :nota_fiscal, :forma_pagamento_id, :pedido_venda_status_id, :pedido_venda_items_attributes
       
 include Filterable
    scope :status, -> (status) {
        statuses = status.split(',')
        where pedido_venda_status_id: statuses }
    
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

    
    
    validates_presence_of :cliente_id, :user_id, :data_solicitacao, :pedido_venda_status_id

    
    belongs_to :user
    belongs_to :cliente
    belongs_to :pedido_venda_status
    belongs_to :forma_pagamento
    has_many :pedido_venda_items, :dependent => :destroy
 
    accepts_nested_attributes_for :pedido_venda_items, :reject_if => :all_blank, :allow_destroy => true

    
 include PublicActivity::Model
 tracked :owner => proc {|controller, model| controller.current_user}

     
  def calculate_totals
    pedido_venda_items.map do |i|
      i.subtotal
    end.sum
  end  

     
end

    


 