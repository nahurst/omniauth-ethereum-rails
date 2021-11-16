Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/ethereum', to: 'sessions#new'
  root to: 'sessions#index'
end
