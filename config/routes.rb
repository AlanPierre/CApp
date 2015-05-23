Rails.application.routes.draw do

  resources :ordem_producaos do
      get "1/update_produtos_op" => "ordem_producaos#update_produtos_op"
  end

    
  resources :layouts do
      member do
            get :clone
        end
      end
    
    
  resources :orcamentos do
      get '/print/' => "print#orcamento_print"
        member do
            get :clone
        end
  end
  resources :pedido_vendas do
      get '/print/' => "print#pedido_venda_print"
  end
  resources :clientes do
      get '/print/' => "print#cliente_print"
  end
    
   resources :cliente_estoque_minimos

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
    
    get 'activities/index'
    get "access_denied" => "default#access_denied"
    get "estado/:estado_id/cidades" => "default#update_cidades"
    get "produto/:produto_id/materials" => "default#update_produtos"
    get "estoque/:tipo_id/:cliente_id/:produto_id/materials" => "default#update_materials_op"
    get "cliente/enderecos" => "default#busca_endereco"
    
    get "cliente/:cliente_id/enderecos" => "default#busca_endereco_cliente"

    get "impressora/:impressora_id/configs" => "default#update_impressora_configs"
    get "gerar-venda/:orcamento_id" => "default#gerar_venda"
    get "gerar-op/:pedido_venda_id" => "default#gerar_op"
    get "/feed" => "activities#index", as: :feed
    get "orcamento-item-descricao/:descricao_id" => "default#update_item_descricao"
    
end
