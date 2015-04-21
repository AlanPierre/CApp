class CreateOrcamentoItems < ActiveRecord::Migration
  def change
    create_table :orcamento_items do |t|
      t.integer :orcamento_id
      t.integer :quantidade
      t.decimal :preco
      t.decimal :desconto
      t.integer :produto_id
      t.integer :material_id
      t.string :descricao

      t.timestamps null: false
    end
  end
end
