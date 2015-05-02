class ClienteEstoqueMinimo < ActiveRecord::Base
    attr_accessible :id, :cliente_id, :produto_id, :material_id, :quantidade, :_destroy, :_update, :_create

end
