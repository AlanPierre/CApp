class CreateClienteStatuses < ActiveRecord::Migration

  def change
    create_table :cliente_statuses do |t|
      t.string :name
      t.boolean :active

      t.timestamps null: false
    end
  end
  def self.down
 
  end

end
