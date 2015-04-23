class CreatePedidoLayoutStatuses < ActiveRecord::Migration
  def change
    create_table :pedido_layout_statuses do |t|
      t.string :name
      t.boolean :active

      t.timestamps null: false
    end
  end
end
