class CreateFormaPagamentos < ActiveRecord::Migration

    def change
    create_table :forma_pagamentos do |t|
      t.string :name
      t.boolean :active

      t.timestamps null: false
    end
  end
     def self.down

    end
end
