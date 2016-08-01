Rails.application.routes.draw do

  get 'posts/new'

  get 'sessions/new'

  root 'static_pages#home'

  # dynamic routes
  get '/users', to: 'users#index'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/users/:id/edit', to: 'users#edit'
  patch '/users/:id/edit', to: 'users#update'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    resources :wibnis

  end

  #RESTful routes
  resources :users
  resources :categories
  resources :wibnis

end
