json.array!(@layouts) do |layout|
  json.extract! layout, :id, :name, :cliente_id, :data_aprovacao, :pedido_layout_status_id, :impressora_id, :impressora_config_id, :produto_id, :material_id, :codigo_barra_id, :digitos, :furo, :etiqueta, :porta_cracha, :observacao
  json.url layout_url(layout, format: :json)
end
