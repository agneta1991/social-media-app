Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  root 'users#index' 

  # get '/users/:user_id/posts/new', to: 'posts#new', as: 'new_user_post'
  # post '/users/:user_id/posts', to: 'posts#create', as: 'create_user_post'

  # get '/users/:user_id/posts/:id/edit', to: 'posts#edit', as: 'edit_user_post'
  # patch '/users/:user_id/posts/:id', to: 'posts#update'

  # delete '/users/:user_id/posts/:id', to: 'posts#destroy', as: 'delete_user_post'

  # get '/users/:user_id/posts/:id/comments/new', to: 'comments#new', as: 'new_user_post_comment'
  # post '/users/:user_id/posts/:id/comments', to: 'comments#create', as: 'create_user_post_comment'

  # get '/users/:user_id/posts/:id/likes/new', to: 'likes#new', as: 'new_user_post_like'
  # post '/users/:user_id/posts/:id/likes', to: 'likes#create', as: 'create_user_post_like'

  resources :users, only: %i(index show) do
    resources :posts do
      resources :comments, only: %i(new create)
      resources :likes, only: %i(new create)
    end
  end
end
