Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  put 'user', to: 'user#update'

  patch 'user', to: 'user#update'

  post 'user', to: 'user#create' 


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
