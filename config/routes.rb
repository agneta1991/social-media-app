Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  root 'users#index' 

  resources :users, only: %i(index show) do
    resources :posts do
      resources :comments, except: %i(index, show)
      resources :likes, only: %i(new create)
    end
  end
end
