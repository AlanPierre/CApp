class CreateClienteEstoqueMinimos < ActiveRecord::Migration
  def change
    create_table :cliente_estoque_minimos do |t|
      t.integer :cliente_id
      t.integer :produto_id
      t.integer :material_id
      t.integer :quantidade

      t.timestamps null: false
    end
  end
end
