class ClienteRamo < ActiveRecord::Base
    attr_accessible :name, :active
    has_many :clientes
end
