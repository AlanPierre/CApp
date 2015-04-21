Rails.application.routes.draw do

  resources :orcamentos
  resources :pedido_vendas
  resources :clientes
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    devise_for :users
    devise_scope :user do
      authenticated :user do
        root 'devise/registrations#edit', as: :authenticated_root
          
      end
      unauthenticated do
        root 'devise/sessions#new', as: :unauthenticated_root
      end
    end
    
    root 'devise/sessions#new'

    get 'activities/index'
    get 'cep/busca-cep/:cep' => 'default#busca_cep'
    get "estado/:estado_id/cidades" => "default#update_cidades"
    get "produto/:produto_id/materials" => "default#update_produtos"
    get "cliente/:cliente_id/enderecos" => "default#busca_endereco"
    get "gera-venda/:orcamento_id" => "default#gerar_venda"
    get "/feed" => "activities#index", as: :feed
    get "orcamento-item-descricao/:descricao_id" => "orcamentos#update_descricao_item"
    

    
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
