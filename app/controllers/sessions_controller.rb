class SessionsController < ApplicationController
  include SessionsHelper
  def new
    render 'new'
  end

  def create
    @user = User.find_by_email(params[:session][:email].to_s.downcase)
    if @user && @user.email =~ /default(.*)default.com/
      if @user.authenticate(params[:session][:password])
        @update_through_controller = 1
        render 'users/edit'
      else
        flash.now[:error] = "Invalid email/password combination"
        render 'new'
      end

    else
      if @user && @user.authenticate(params[:session][:password])
        sign_in @user
        redirect_back_or root_url
      else
        flash.now[:error] = "Invalid email/password combination"
        render 'new'
      end

    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end


end