class OrcamentoContato < ActiveRecord::Base
    
    attr_accessible :orcamento_id, :data_contato, :descricao, :id
    belongs_to :orcamento

end
