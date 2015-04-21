json.array!(@pedido_vendas) do |pedido_venda|
  json.extract! pedido_venda, :id, :user_id, :cliente_id, :data_solicitacao, :detalhes, :recibo, :nota_fiscal, :forma_pagamento_id, :pedido_venda_status_id
  json.url pedido_venda_url(pedido_venda, format: :json)
end
