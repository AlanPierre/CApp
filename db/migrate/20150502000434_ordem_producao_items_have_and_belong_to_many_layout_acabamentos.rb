class OrdemProducaoItemsHaveAndBelongToManyLayoutAcabamentos < ActiveRecord::Migration
    def self.up
    create_table :layout_acabamentos_ordem_producao_items, :id => false do |t|
    t.references :ordem_producao_item, :layout_acabamento
    end
end

    def self.down
    drop_table :layout_acabamentos_ordem_producao_items
    end
end

