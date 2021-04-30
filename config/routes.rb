Rails.application.routes.draw do
  # root page is index of users
  get '/', to: 'users#index', as: 'landing'
  # can't edit tweet
  resources :tweets, except: :edit
  # user creation include in index view
  resources :users, except: :new
  # to see the followers of user
  get '/users/:id/followers', to: 'users#followers', as: 'followers'
  # to see people who follow user
  get '/users/:id/following', to: 'users#following', as: 'following'
  # to get user profile image
  get '/asset/users/:id/profile/', to: 'users#file', as: 'user_profile_img'



  # to connect user with his id
  get '/auth/:id/login', to: 'users#login', as: 'login'
  # to disconnect user with his id
  get '/auth/logout', to: 'users#logout', as: 'logout'


  # to get follow feed of authenticated user
  get '/following/', to: 'tweets#follow_feed', as: 'follow_feed'
  # to view tweets of an hashtag
  get '/hashtags/:hashtag', to: 'tweets#hashtag', as: 'hashtag'

  # to follow user
  get '/follow/:follow_user_id', to: 'follows#follow', as: 'follow'
  # to unfollow user
  get '/unfollow/:follow_user_id', to: 'follows#unfollow', as: 'unfollow'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
