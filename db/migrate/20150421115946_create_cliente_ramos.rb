class CreateClienteRamos < ActiveRecord::Migration
  def change
    create_table :cliente_ramos do |t|
      t.string :name
      t.boolean :active

      t.timestamps null: false
    end
  end
end
