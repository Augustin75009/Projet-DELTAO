Rails.application.routes.draw do
  get 'payments/new'
  get 'payments/create'
  devise_for :users
  root to: 'pages#home'
  get 'purchases/index'
  get 'pages/tessa'
  resources :products do
    resources :purchases, only: []
  end
  resources :lessons do
    resources :purchases, only: []
  end
  resources :carts, only: [:new, :create, :destroy, :index, :show] do
    resources :purchases, only: [:new, :create, :edit, :update, :destroy, :index] do
      resources :payments, only: [:new, :create]
    end
  end

  resources :carts, only: [:create] do
    resources :users
  end

  resources :cart_items, only: [:create, :destroy, :index, :update]
  resources :events, only: [:new, :create, :destroy, :index, :show, :update, :edit]
  resources :teachings, only: [:new, :create, :destroy, :index, :show, :update, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
