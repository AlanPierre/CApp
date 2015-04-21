json.array!(@orcamentos) do |orcamento|
  json.extract! orcamento, :id, :user_id, :cliente_id, :data_solicitacao, :data_aprovacao, :referencia, :condicoes, :orcamento_status_id
  json.url orcamento_url(orcamento, format: :json)
end
