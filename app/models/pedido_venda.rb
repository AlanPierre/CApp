class PedidoVenda < ActiveRecord::Base

    attr_accessible :user_id, :cliente_id, :data_solicitacao, :detalhes,  :recibo, :nota_fiscal, :forma_pagamento_id, :pedido_venda_status_id, :pedido_venda_items_attributes
    
     include Filterable
    scope :status, -> (status) { where pedido_venda_status_id: status }
    scope :vendedor, -> (vendedor) { where user_id: vendedor }

    
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

    


 