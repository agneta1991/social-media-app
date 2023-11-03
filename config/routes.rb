Rails.application.routes.draw do
  root to: 'users#index'

  get '/users/:user_id/posts/new', to: 'posts#new', as: 'new_user_post'
  post '/users/:user_id/posts', to: 'posts#create', as: 'create_user_post'

  get '/users/:user_id/posts/:id/comments/new', to: 'comments#new', as: 'new_user_post_comment'
  post '/users/:user_id/posts/:id/comments', to: 'comments#create', as: 'create_user_post_comment'

  get '/users/:user_id/posts/:id/likes/new', to: 'likes#new', as: 'new_user_post_like'
  post '/users/:user_id/posts/:id/likes', to: 'likes#create', as: 'create_user_post_like'

  resources :users, only: %i(index show) do
    resources :posts, only: %i(index show) do
      resources :comments, only: %i(new create)
      resources :likes, only: %i(new create)
    end
  end
end
