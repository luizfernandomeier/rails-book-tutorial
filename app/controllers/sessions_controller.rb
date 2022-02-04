class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:name])
    # the try method checks if a variable has a value of nil before trying to call the method (`authenticate`)
    # if user.try(:authenticate, params[:password])
    if user&.authenticate(params[:password]) # does the same thing
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: 'Invalid user/password combination'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_index_url, notice: 'Logged out'
  end
end
