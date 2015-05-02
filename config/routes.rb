Rails.application.routes.draw do

  resources :ordem_producaos do
      get "/update_produtos_op" => "ordem_producaos#update_produtos_op"
  end
    
  resources :layouts
  resources :orcamentos
  resources :pedido_vendas do
      get '/print/' => "print#pedido_venda_print"
  end
  resources :clientes do
      get '/print/' => "print#cliente_print"
  end
    
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    devise_for :users
    devise_scope :user do
      authenticated :user do
        root "default#index", as: :authenticated_root
      end
      unauthenticated do
        root 'devise/sessions#new', as: :unauthenticated_root
      end
    end
    
    root 'devise/sessions#new'
    
    get 'activities/index'
    get "access_denied" => "default#access_denied"
    get "estado/:estado_id/cidades" => "default#update_cidades"
    get "produto/:produto_id/materials" => "default#update_produtos"
    get "estoque/:tipo_id/:cliente_id/:produto_id/materials" => "default#update_materials_op"
    get "cliente/:cliente_id/enderecos" => "default#busca_endereco"
    get "impressora/:impressora_id/configs" => "default#update_impressora_configs"
    get "gera-venda/:orcamento_id" => "default#gerar_venda"
    get "/feed" => "activities#index", as: :feed
    get "orcamento-item-descricao/:descricao_id" => "default#update_item_descricao"
    
end
