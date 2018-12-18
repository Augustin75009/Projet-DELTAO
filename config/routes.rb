Rails.application.routes.draw do
  devise_for :users, :skip => :registration
  root to: 'pages#home'
  resources :products do
    resources :purchases
  end

  resources :carts, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
