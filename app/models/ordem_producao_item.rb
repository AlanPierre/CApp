class OrdemProducaoItem < ActiveRecord::Base
     attr_accessible :id, :ordem_producao_id, :user_id, :produto_id, :material_id, :layout_id, :quantidade, :perdas_quantidade, :layout_acabamento_ids,:_destroy, :_create, :_update
    
    validate :estoque_cliente


    belongs_to :ordem_producao
    belongs_to :produto
    belongs_to :material
    belongs_to :layout
    belongs_to :user
    has_and_belongs_to_many :layout_acabamentos

    
   def quantidade_negativa
        if quantidade < 0
          errors.add(:quantidade, 'Quantidade não pode ser negativa')
        end
    end
    
        
    def estoque_cliente
        ordem_producao = OrdemProducao.find(self.ordem_producao_id)
        cliente = ordem_producao.cliente
        saldo = 0   
        if cliente.cliente_faturamento_id == 1 && ordem_producao.tipo == '1'
                if OrdemProducaoItem.exists?(:id => self.id)
                   item = OrdemProducaoItem.find(self.id) if present?
                    saldo = item.quantidade.to_f
                end        
            estoques = cliente.cliente_estoques
            estoques.each do |estoque|
              if estoque.produto_id == self.produto_id && estoque.material_id == self.material_id
                if self.quantidade > estoque.saldo + saldo
                    self.errors.add(:quantidade, 'Estoque insuficiente')
                end
              end
            end
        end
    end

 
end
