class SessionsController < ApplicationController

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      flash[:alert] = nil
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      # session[:login_error] = "invalid credentials"
      # redirect_to login_path, login_error: "The email or password is incorrect"
      # render
      # redirect_to login_path(error: "Invalid credentials")
      flash[:alert] = "Invalid credentials"
      redirect_to login_path

    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
