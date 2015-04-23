class CreateImpressoras < ActiveRecord::Migration
  def change
    create_table :impressoras do |t|
      t.string :name
      t.boolean :active

      t.timestamps null: false
    end
  end
end
