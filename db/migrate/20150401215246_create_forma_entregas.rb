class CreateFormaEntregas < ActiveRecord::Migration

  def change
    create_table :forma_entregas do |t|
      t.string :name
      t.boolean :active

      t.timestamps null: false
    end
  end
     def self.down

    end
end
