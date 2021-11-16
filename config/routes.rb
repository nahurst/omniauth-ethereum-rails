Rails.application.routes.draw do
  post '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/ethereum', to: 'sessions#new'
  root to: 'sessions#index'
end
