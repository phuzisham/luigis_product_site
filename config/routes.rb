Rails.application.routes.draw do
  root :to => 'products#index'

  resources :genres do
    resources :artists
  end
end
