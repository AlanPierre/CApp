class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome_fantasia
      t.string :razao_social
      t.string :cnpj, :limit => 14
      t.string :inscricao_municipal
      t.string :inscricao_estadual
      t.integer :cliente_faturamento_id
      t.integer :cliente_status_id
      t.integer :cliente_ramo_id
      t.integer :user_id
      t.text :observacao
      t.boolean :notificacao

      t.timestamps null: false
    end
  end
end
