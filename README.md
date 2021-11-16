rails new railsomnionly
cd railsomnionly
routes.rb
  post '/auth/:provider/callback', to: 'sessions#create'
Gemfile
  gem "omniauth-ethereum", path: '/Users/nathan/Personal/omniauth-ethereum'
  gem "eth", "~> 0.4.16"
  gem 'omniauth-rails_csrf_protection'
rails g controller sessions
omniauth.rb
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :ethereum
  end
copy the sessions_controller
application.html.erb
  <p class="notice"><%= notice %></p>
