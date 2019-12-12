Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :transactions
  resources :news, only: [:index]
  resources :market_data, only: [:index]
  resources :coins, only: [:index, :show]
  resources :exchanges, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
