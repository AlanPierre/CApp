json.array!(@ordem_producaos) do |ordem_producao|
  json.extract! ordem_producao, :id, :cliente_id, :user_id, :ordem_producao_status_id, :data_solicitacao, :data_entrega_previsao, :data_pdf, :data_finalizacao, :data_entrega, :abrir_pasta, :recibo, :nota_fiscal, :dados_variaveis, :detalhes, :detalhes_entrega, :tipo
  json.url ordem_producao_url(ordem_producao, format: :json)
end
