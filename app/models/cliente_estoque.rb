class ClienteEstoque < ActiveRecord::Base
    self.table_name = 'cliente_estoques'
  after_initialize :readonly!
    belongs_to :cliente
    belongs_to :material
    belongs_to :produto
end
