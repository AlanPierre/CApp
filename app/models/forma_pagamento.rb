class FormaPagamento < ActiveRecord::Base
        attr_accessible :name, :active
        has_many :pedido_vendas
end
