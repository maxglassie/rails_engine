Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:index]
      resources :merchants, except: [:new, :edit]
      resources :payments, path: 'transactions', only: [:index, :show, :create]
      resources :customers, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
