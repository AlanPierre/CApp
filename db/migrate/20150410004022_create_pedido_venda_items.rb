class CreatePedidoVendaItems < ActiveRecord::Migration
  def change
    create_table :pedido_venda_items do |t|
      t.integer :pedido_venda_id
      t.integer :quantidade
      t.decimal :preco, :precision => 8, :scale => 2
      t.integer :material_id
      t.integer :produto_id
      t.timestamps null: false
    end
  end
end
