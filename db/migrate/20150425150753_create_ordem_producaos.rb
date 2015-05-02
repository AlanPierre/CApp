class CreateOrdemProducaos < ActiveRecord::Migration
  def change
    create_table :ordem_producaos do |t|
      t.integer :cliente_id
    t.integer :cliente_endereco_id
      t.integer :user_id
      t.integer :ordem_producao_status_id
      t.date :data_solicitacao
      t.date :data_entrega_previsao
      t.date :data_pdf
      t.date :data_finalizacao
      t.date :data_entrega
      t.boolean :abrir_pasta
      t.boolean :recibo
      t.boolean :nota_fiscal
      t.string :dados_variaveis
      t.text :detalhes
      t.text :detalhes_entrega
      t.integer :tipo

      t.timestamps null: false
    end
  end
end
