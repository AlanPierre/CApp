class Material < ActiveRecord::Base
    attr_accessible :name, :active,  :id
    has_and_belongs_to_many :produtos
    has_many :pedido_venda_items
        
end
