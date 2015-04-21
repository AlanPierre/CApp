class CreateOrcamentos < ActiveRecord::Migration
  def change
    create_table :orcamentos do |t|
      t.integer :user_id
      t.integer :cliente_id
      t.date :data_solicitacao
      t.date :data_aprovacao
      t.string :referencia
      t.string :condicoes
      t.integer :orcamento_status_id
        t.integer :cliente_endereco_id

      t.timestamps null: false
    end
  end
end
