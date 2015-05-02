class CreateOrcamentoItems < ActiveRecord::Migration
  def change
    create_table :orcamento_items do |t|
      t.integer :orcamento_id
      t.integer :quantidade
      t.decimal :preco,  :precision => 8, :scale => 2
      t.integer :produto_id
      t.integer :material_id
      t.text :descricao

      t.timestamps null: false
    end
  end
end
