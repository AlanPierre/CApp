class CreateOrcamentoContatos < ActiveRecord::Migration
  def change
    create_table :orcamento_contatos do |t|
      t.integer :orcamento_id
      t.date :data_contato
      t.string :descricao

      t.timestamps null: false
    end
  end
end
