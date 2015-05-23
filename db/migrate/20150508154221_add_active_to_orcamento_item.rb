class AddActiveToOrcamentoItem < ActiveRecord::Migration
  def change
    add_column :orcamento_items, :active, :boolean
  end
end
