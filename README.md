To duplicate these steps:

```
rails new your-app
cd your-app
```

3. Copy `config/routes.rb` to your app.
```
Rails.application.routes.draw do
  post '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/ethereum', to: 'sessions#new'
  root to: 'sessions#index'
end
```

2. Add to `Gemfile`:
```
gem "omniauth-ethereum", path: '/Users/nathan/Personal/omniauth-ethereum'
gem "eth", "~> 0.4.16"
gem 'omniauth-rails_csrf_protection'
```

3. Copy `app/controllers/sessions` to your app.
```
class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    if request.env['omniauth.auth']
      flash[:notice] = "Logged in"
    else
      flash[:notice] = "Unable to log in"
    end

    redirect_to '/'
  end

  def index
    render inline: "<%= button_to 'Sign in', auth_ethereum_path %>", layout: true
  end
end
```

4. Copy `config/initializers/omniauth.rb` to your app.
```
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :ethereum
end
```

5. Add to `application.html.erb`
```
<p class="notice"><%= notice %></p>
```