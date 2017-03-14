Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:index]
      resources :merchants, except: [:new, :edit]
      resources :payments, path: 'transactions', only: [:index, :show, :create]
      resources :customers, only: [:index, :show]
    end
  end
end
