class SessionsController < ApplicationController
  def create
    create_session
    update_token

    redirect_to root_path
  end

  def destroy
    destroy_session
    redirect_to root_path
  end

  private

  def user
    @user = User.find_or_create_by(username: username)
  end

  def create_session
    session[:current_user_id] = user.id
  end

  def destroy_session
    session[:current_user_id] = nil
  end

  def username
    request.env["omniauth.auth"]["info"]["nickname"]
  end

  def github_token
    request.env["omniauth.auth"]["credentials"]["token"]
  end

  def update_token
    user.update!(token: github_token) if github_token
  end
end
