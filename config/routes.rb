Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_page#home'
  get  '/help', to: 'static_page#help'
  get  '/about', to: 'static_page#about'
  get  '/contact', to: 'static_page#contact'
  get '/signup', to: 'users#new'
  post '/signup', to:'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end