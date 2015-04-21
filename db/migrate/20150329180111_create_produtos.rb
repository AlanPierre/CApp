class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :name
      t.boolean :active

      t.timestamps null: false
    end
  end
end
