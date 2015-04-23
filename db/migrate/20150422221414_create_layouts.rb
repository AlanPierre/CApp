class CreateLayouts < ActiveRecord::Migration
  def change
    create_table :layouts do |t|
      t.string :name
      t.integer :cliente_id
      t.date :data_aprovacao
      t.integer :pedido_layout_status_id
      t.integer :impressora_id
      t.integer :impressora_config_id
      t.integer :produto_id
      t.integer :material_id
      t.integer :codigo_barra_id
      t.integer :digitos
      t.boolean :furo
      t.boolean :etiqueta
      t.boolean :porta_cracha
      t.string :observacao

      t.timestamps null: false
    end
  end
end
