class StaticPagesController < ApplicationController
  def home
    @user = User.find_by_id(session[:current_user_id])
  end
end
