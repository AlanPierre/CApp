class OrdemProducao < ActiveRecord::Base
        attr_accessible :cliente_id, :cliente_endereco_id, :user_id, :ordem_producao_status_id, :data_solicitacao, :data_entrega_previsao, :data_pdf, :data_finalizacao, :data_entrega, :abrir_pasta, :recibo, :nota_fiscal, :dados_variaveis, :detalhes, :detalhes_entrega, :tipo,  :ordem_producao_items_attributes
    
    belongs_to :user
    belongs_to :cliente
    belongs_to :ordem_producao_status
    has_many :ordem_producao_items, :dependent => :destroy
    
    Tipos =  [["OP", 1], ["Amostra",2], ["Re-impressão",3]]

    accepts_nested_attributes_for :ordem_producao_items, :reject_if => :all_blank, :allow_destroy => true

end
