class CreateImpressoraConfigs < ActiveRecord::Migration
  def change
    create_table :impressora_configs do |t|
      t.string :name
      t.boolean :active
      t.string :impressora_id

      t.timestamps null: false
    end
  end
end
