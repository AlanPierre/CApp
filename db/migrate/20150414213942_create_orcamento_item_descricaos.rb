class CreateOrcamentoItemDescricaos < ActiveRecord::Migration
  def change
    create_table :orcamento_item_descricaos do |t|
      t.string :name
      t.string :descricao

      t.timestamps null: false
    end
  end
end
