class CreateClienteFaturamentos < ActiveRecord::Migration

  def change
    create_table :cliente_faturamentos do |t|
      t.string :name
      t.boolean :active

      t.timestamps null: false
    end
  end
      def self.down

  end

end
