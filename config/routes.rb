Rails.application.routes.draw do
  get 'payments/new'
  get 'payments/create'
  devise_for :users
  root to: 'pages#home'
  resources :products do
    resources :purchases, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :carts, only: [:create, :destroy, :index]

  resources :purchases, only: [] do
    resources :payments, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
