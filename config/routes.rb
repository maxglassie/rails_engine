Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'search#show'
      end
      resources :merchants, except: [:new, :edit]

      resources :invoices, only: [:index]
      resources :payments, path: 'transactions', only: [:index, :show, :create]
      resources :customers, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
    end
  end
