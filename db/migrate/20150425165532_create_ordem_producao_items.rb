class CreateOrdemProducaoItems < ActiveRecord::Migration
  def change
    create_table :ordem_producao_items do |t|
      t.integer :ordem_producao_id
      t.integer :produto_id
      t.integer :material_id
      t.integer :user_id
      t.integer :layout_id
      t.integer :quantidade
      t.integer :perdas_quantidade

      t.timestamps null: false
    end
  end
end
