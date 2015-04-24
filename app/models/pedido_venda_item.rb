class PedidoVendaItem < ActiveRecord::Base
    attr_accessible :id, :pedido_venda_id, :valor,:desconto, :quantidade, :produto_id, :material_id,  :_destroy, :_create, :_update

    belongs_to :pedido_venda
    belongs_to :produto
    belongs_to :material
 

    def subtotal
        [self.quantidade,self.valor].compact.inject(:*)
    end

end

