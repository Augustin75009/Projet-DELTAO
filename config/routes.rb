Rails.application.routes.draw do
  namespace :admin do
      resources :lessons
      resources :slots
      resources :events
      resources :users
      resources :students
      resources :signatures
      resources :purchases
      resources :gifts
      # resources :carts
      # resources :cart_items
      # resources :products
      # resources :teachings

      root to: "users#index"
    end
  patch 'admin/signature/notification/:id', to: 'admin/signatures#notification', as: :notification
  post 'admin/signature/notification_one/:id', to: 'admin/signatures#notification_one', as: :notification_one
  post 'admin/user/export_users', to: 'admin/users#export_users', as: :export_users
  get 'charge' => 'payments#charge'
  get 'payments/new'
  get 'payments/create'
  get 'payments/show'
  post 'cart_items/top_up', to: 'cart_items#top_up'
  post 'cart_items/top_down', to: 'cart_items#top_down'
  devise_for :users
  root to: 'pages#home'
  get 'account/reservations', to: 'purchases#index', as: :purchases_index
  post 'use_gift_code', to: 'gifts#use_gift_code', as: :use_gift_code
  post 'create_from_gift', to: 'purchases#create_from_gift', as: :create_from_gift
  get 'account/settings', to: 'pages#settings', as: :users_setting
  post 'account/delete', to: 'pages#delete_account', as: :delete_user
  post 'account/update_user', to: 'pages#update_user_infos', as: :update_user_infos
  get 'pages/tessa'
  resources :products do
    resources :purchases, only: []
  end
  resources :lessons do
    resources :purchases, only: []
  end
  resources :carts, only: [:new, :create, :destroy, :index, :show] do
    resources :purchases, only: [:new, :create, :edit, :update, :destroy, :index] do
      resources :payments, only: [:new, :create, :show]
    end
    resources :gifts, only: [:new, :create, :edit, :update, :destroy, :index] do
      resources :payments, only: [:new, :create, :show]
    end
  end

  resources :carts, only: [:create] do
    resources :users
  end

  resources :cart_items, only: [:create, :destroy, :index, :update]
  resources :events, only: [:new, :create, :destroy, :index, :show, :update, :edit]
  resources :teachings, only: [:new, :create, :destroy, :index, :show, :update, :edit]
  resources :signatures, only: [:new, :show, :update] do
    resources :students, only: [:new, :create, :show]
    patch 'notification'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
