class Produto < ActiveRecord::Base
    attr_accessible :name, :active, :id, :material_ids
    has_and_belongs_to_many :materials
    has_many :pedido_venda_items

end
