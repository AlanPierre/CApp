class CreatePedidoVendas < ActiveRecord::Migration
  def change
    create_table :pedido_vendas do |t|
      t.integer :user_id
      t.integer :cliente_endereco_id
      t.integer :cliente_id
      t.date :data_solicitacao
      t.text :detalhes
      t.boolean :recibo
      t.boolean :nota_fiscal
      t.integer :forma_pagamento_id
      t.integer :pedido_venda_status_id
      t.decimal :desconto,  :precision => 8, :scale => 2
    

      t.timestamps null: false
    end
  end
end
