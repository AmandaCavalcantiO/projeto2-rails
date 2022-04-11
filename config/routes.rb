Rails.application.routes.draw do
  resources :categories
  resources :products
  get 'home', to: 'pages#home', as: 'home'
  root to: 'pages#home'


    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }


end
