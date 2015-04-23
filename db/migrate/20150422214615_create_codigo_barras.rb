class CreateCodigoBarras < ActiveRecord::Migration
  def change
    create_table :codigo_barras do |t|
      t.string :name
      t.boolean :active

      t.timestamps null: false
    end
  end
end
