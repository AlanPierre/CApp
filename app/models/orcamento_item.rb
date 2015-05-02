class OrcamentoItem < ActiveRecord::Base
    attr_accessible :id, :orcamento_id, :quantidade, :preco, :desconto, :produto_id, :material_id, :descricao, :_destroy

    belongs_to :orcamento
    belongs_to :produto
    belongs_to :material

    def subtotal
        [self.quantidade,self.preco].compact.inject(:*)
    end


end
         