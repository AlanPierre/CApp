class OrcamentoItem < ActiveRecord::Base
    before_save :format_values
    attr_accessible :id, :orcamento_id, :quantidade, :preco, :desconto, :produto_id, :material_id, :descricao, :_destroy

    belongs_to :orcamento
    belongs_to :produto
    belongs_to :material
 
    def subtotal
        [self.quantidade,self.preco].compact.inject(:*)
    end
    

  private

  def format_values
    self.preco.to_s.delete!('^0-9') unless self.preco.nil?
  end
end
