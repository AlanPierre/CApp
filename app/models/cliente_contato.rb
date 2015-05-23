class ClienteContato < ActiveRecord::Base
    attr_accessible :cliente_id, :nome, :email, :telefone, :observacao, :id, :_destroy,:_create, :_update
    
    belongs_to :cliente
    validates_presence_of :nome, :observacao
    
end
