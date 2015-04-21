class CreateDepartamentos < ActiveRecord::Migration

  def change
    create_table :departamentos do |t|
      t.string :name

      t.timestamps null: false
    end
  end
  def self.down

  end

end
