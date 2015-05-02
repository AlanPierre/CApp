class CreateLayoutAcabamentos < ActiveRecord::Migration
  def change
    create_table :layout_acabamentos do |t|
      t.string :name
      t.boolean :active

      t.timestamps null: false
    end
  end
end
