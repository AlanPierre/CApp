class ClienteEndereco < ActiveRecord::Base
    attr_accessible :id, :cliente_id, :cidade_id, :estado_id, :name, :bairro, :rua, :numero, :complemento, :cep, :rota, :forma_entrega_id, :observacao, :_destroy

    validates_presence_of  :cidade_id, :estado_id, :rota,  :name
    
    belongs_to :estado
    belongs_to :cliente
    belongs_to :forma_entrega
    belongs_to :cidade
end
