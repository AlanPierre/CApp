class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.string :name
      t.string :uf

      t.timestamps null: false
    end
  end
end
