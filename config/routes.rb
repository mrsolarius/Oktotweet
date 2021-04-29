Rails.application.routes.draw do
  get '/', to: 'users#index', as: 'landing'
  resources :tweets
  resources :users
  get '/following/', to: 'tweets#follow_feed', as: 'follow_feed'
  get '/hashtags/:hashtag', to: 'tweets#hashtag', as: 'hashtag'
  get '/auth/:id/login', to: 'users#login', as: 'login'
  get '/auth/logout', to: 'users#logout', as: 'logout'
  get '/users/:id/followers', to: 'users#followers', as: 'followers'
  get '/users/:id/following', to: 'users#following', as: 'following'
  get '/asset/users/:id/profile/', to: 'users#file', as: 'user_profile_img'
  get '/follow/:follow_user_id', to: 'follows#follow', as: 'follow'
  get '/unfollow/:follow_user_id', to: 'follows#unfollow', as: 'unfollow'
  namespace :validators do
    get :client_uniqueness, to: 'validators#client_uniqueness'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
