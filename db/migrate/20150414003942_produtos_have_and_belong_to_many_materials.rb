class ProdutosHaveAndBelongToManyMaterials < ActiveRecord::Migration
    def self.up
    create_table :materials_produtos, :id => false do |t|
    t.references :produto, :material
    end
end

    def self.down
    drop_table :materials_produtos
    end
end