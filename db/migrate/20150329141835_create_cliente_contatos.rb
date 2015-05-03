class CreateClienteContatos < ActiveRecord::Migration
  def change
    create_table :cliente_contatos do |t|
      t.string :nome
      t.string :email
      t.string :telefone, :limit => 11
      t.string :observacao
      t.integer :cliente_id

      t.timestamps null: false
    end
  end
end
