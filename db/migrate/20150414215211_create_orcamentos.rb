class CreateOrcamentos < ActiveRecord::Migration
  def change
    create_table :orcamentos do |t|
      t.integer :user_id
      t.integer :cliente_id
      t.integer :cliente_endereco_id
      t.date :data_solicitacao
      t.date :data_aprovacao
      t.string :referencia
      t.text :condicoes
      t.integer :orcamento_status_id
      t.decimal :desconto,  :precision => 8, :scale => 2
        

      t.timestamps null: false
    end
  end
end
