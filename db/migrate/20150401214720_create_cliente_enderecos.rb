class CreateClienteEnderecos < ActiveRecord::Migration
  def change
    create_table :cliente_enderecos do |t|
      t.integer :cliente_id
      t.integer :cidade_id
      t.integer :estado_id
      t.string :name
      t.string :bairro
      t.string :rua
      t.integer :numero
      t.string :complemento
      t.string :cep, :limit => 8
      t.string :observacao
      t.integer :rota
      t.integer :forma_entrega_id
      t.timestamps null: false
    end
  end
end
