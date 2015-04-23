class PedidoLayoutStatus < ActiveRecord::Base
    attr_accessible :name, :active
    has_many :layouts
end
