class CreateOrdemProducaoStatuses < ActiveRecord::Migration
  def change
    create_table :ordem_producao_statuses do |t|
      t.string :name
      t.boolean :active

      t.timestamps null: false
    end
  end
end
