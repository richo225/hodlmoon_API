Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :transactions
  resources :news, only: [:index]
  resources :market_data, only: [:index]
  jsonapi_resources :coins, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
