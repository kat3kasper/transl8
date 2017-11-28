class SessionsController < ApplicationController
  def create
    puts request.env['omniauth.auth']
  end
end
