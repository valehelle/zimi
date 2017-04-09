Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  post 'post', to: 'post#create' 
  get 'post', to: 'post#index'
  post 'friend/request/[:email]', to: 'relationship#friend_request'
  get 'friends', to: 'relationship#friends'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
