Rails.application.routes.draw do
  root 'static_pages#home'

  get 'posts/new'

  get 'sessions/new'



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

  resources :wibnis do
    resources :comments
  end

  #RESTful routes
  post '/wibnis/:id/comments/new', to: 'comments#create'
  delete 'wibnis/:wibni_id/comment/:comment_id/delete', to: 'comments#delete'
  resources :users
  resources :categories
  resources :wibnis
  resources :comments

end
