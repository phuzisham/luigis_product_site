Rails.application.routes.draw do
  root :to => 'application#index'

  resources :products do
    resources :reviews
  end
end
