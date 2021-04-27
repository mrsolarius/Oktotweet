Rails.application.routes.draw do
  resources :tweets
  resources :users
  get '/users/:id/login', to: 'users#login', as: 'login'
  get '/asset/users/:id/profile/', to: 'users#file', as: 'user_profile_img'
  namespace :validators do
    get :client_uniqueness, to: 'validators#client_uniqueness'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
