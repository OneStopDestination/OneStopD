class SessionsController < ApplicationController
  include SessionsHelper
  def new
    render 'new'
  end

  def create
    user = User.find_by_email(params[:session][:email].to_s.downcase)
    print(user)
    if user && user.authenticate(params[:session][:password])
      print(user)
      sign_in user
      redirect_back_or root_url
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end


end