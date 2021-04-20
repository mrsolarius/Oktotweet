Rails.application.routes.draw do
  resources :users
  get '/asset/users/:id/profile/', to: 'users#file', as: 'user_profile_img'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
