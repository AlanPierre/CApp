class Orcamento < ActiveRecord::Base
    attr_accessible :user_id, :cliente_id, :id, :data_solicitacao, :data_aprovacao, :referencia, :condicoes, :orcamento_status_id,  :orcamento_items_attributes, :orcamento_contatos_attributes
    
    include Filterable
    scope :status, -> (status) { where orcamento_status_id: status }
    scope :vendedor, -> (vendedor) { where user_id: vendedor }


    belongs_to :user
    belongs_to :cliente
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
def self.search(search)  
if search  
  where('id =', "%#{search}%")  
else  
  all  
end  
end

     
end

 