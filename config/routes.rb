Rails.application.routes.draw do
  devise_for :users, :skip => :registration
  root to: 'pages#home'
  resources :products do
    resources :purchases
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
