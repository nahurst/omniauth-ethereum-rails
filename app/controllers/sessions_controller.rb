class SessionsController < ApplicationController
  # TODO remove?
  skip_before_action :verify_authenticity_token, only: :create

  def create
    if auth_hash
      flash[:notice] = "Logged in"
    else
      flash[:notice] = "Unable to log in"
    end

    redirect_to '/'
  end

  def index
    render inline: "<%= button_to 'Sign in', auth_ethereum_path %>", layout: true

  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
