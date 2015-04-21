json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nome_fantasia, :razao_social, :cnpj, :inscricao_municipal, :inscricao_estadual, :cliente_faturamento_id, :cliente_status_id, :user_id, :observacao, :notificao
  json.url cliente_url(cliente, format: :json)
end
