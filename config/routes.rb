Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:index]
      resources :merchants, except: [:new, :edit]
      resources :payments, only
    end
  end
end
