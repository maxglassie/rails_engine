Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'search#show'
      end
      resources :merchants, except: [:new, :edit]

      namespace :customers do
        get '/find', to: 'search#show'
      end
      resources :customers, only: [:index, :show]

      namespace :invoices do
        get '/find', to: 'search#show'
      end
      resources :invoices, only: [:index, :show]

      namespace :items do
        get '/find', to: 'search#show'
      end
      resources :items, only: [:index, :show]

      namespace :invoice_items do
        get '/find', to: 'search#show'
      end
      resources :invoice_items, only: [:index, :show]

      resources :payments, path: 'transactions', only: [:index, :show, :create]

      end
    end
  end
