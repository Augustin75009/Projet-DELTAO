Rails.application.routes.draw do
  get 'payments/new'
  get 'payments/create'
  devise_for :users
  root to: 'pages#home'
  resources :products do
    resources :purchases, only: []
  end
  resources :carts, only: [:new, :create, :destroy, :index, :show] do
    resources :purchases, only: [:new, :create, :edit, :update, :destroy, :index] do
      resources :payments, only: [:create]
    end
  end

  resources :cart_items, only: [:create, :destroy, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
