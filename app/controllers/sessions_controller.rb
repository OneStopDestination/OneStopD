class SessionsController < ApplicationController
  include SessionsHelper
  def new
    render 'new'
  end

  def create
    @user = User.find_by_email(params[:session][:email].to_s.downcase)

    if @user && @user.authenticate(params[:session][:password])

      sign_in @user
      if @user.email="hiamrutha.ks@gmail.com"
        render 'users/edit'
      else
        redirect_back_or root_url
      end
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