class CreateOrcamentoStatuses < ActiveRecord::Migration
  def change
    create_table :orcamento_statuses do |t|
      t.string :name
      t.boolean :active

      t.timestamps null: false
    end
  end
end
