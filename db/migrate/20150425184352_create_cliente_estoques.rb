class CreateClienteEstoques < ActiveRecord::Migration
  def up
      self.connection.execute %Q( CREATE OR REPLACE VIEW cliente_estoques_tmp AS
          SELECT clientes.id AS cliente_id, ordem_producao_items.produto_id, ordem_producao_items.material_id, 0 as entrada, Sum(ordem_producao_items.quantidade) AS saida 
                  FROM (clientes INNER JOIN ordem_producaos ON clientes.id = ordem_producaos.cliente_id) 
                  INNER JOIN ordem_producao_items ON ordem_producaos.id = ordem_producao_items.ordem_producao_id 
                  GROUP BY clientes.id, ordem_producao_items.produto_id, ordem_producao_items.material_id 
                  UNION SELECT clientes.id AS cliente_id, pedido_venda_items.produto_id, pedido_venda_items.material_id, Sum(pedido_venda_items.quantidade) AS entrada, 0 as saida 
                  FROM (clientes INNER JOIN pedido_vendas ON clientes.id = pedido_vendas.cliente_id) 
                  INNER JOIN pedido_venda_items ON pedido_vendas.id = pedido_venda_items.pedido_venda_id 
                  GROUP BY clientes.id, pedido_venda_items.produto_id, pedido_venda_items.material_id;
          )
    
      self.connection.execute %Q( CREATE OR REPLACE VIEW cliente_estoques AS
          SELECT cliente_estoques_tmp.cliente_id, cliente_estoques_tmp.produto_id, cliente_estoques_tmp.material_id, Sum(cliente_estoques_tmp.entrada -cliente_estoques_tmp.saida) AS saldo
FROM cliente_estoques_tmp
GROUP BY cliente_estoques_tmp.cliente_id, cliente_estoques_tmp.produto_id, cliente_estoques_tmp.material_id;

          )
    
    
    
    

  end

  def down
      self.connection.execute "DROP VIEW IF EXISTS cliente_estoques_tmp;"
      self.connection.execute "DROP VIEW IF EXISTS cliente_estoques;"
  end
end 