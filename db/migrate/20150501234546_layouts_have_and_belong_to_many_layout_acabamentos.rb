class LayoutsHaveAndBelongToManyLayoutAcabamentos < ActiveRecord::Migration
    def self.up
    create_table :layout_acabamentos_layouts, :id => false do |t|
    t.references :layout, :layout_acabamento
    end
end

    def self.down
    drop_table :layout_acabamentos_layouts
    end
end

