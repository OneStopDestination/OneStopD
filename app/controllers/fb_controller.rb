class FbController < ApplicationController
  require "fbgraph"
  before_filter :setup_client
  include SessionsHelper
  def login
    redirect_to @client.authorization.authorize_url(:redirect_uri => fb_redirect_url , :scope => 'email')
  end

  def redirect
    access_token = @client.authorization.process_callback(params[:code], :redirect_uri => fb_redirect_url)
    user_info = @client.selection.me.info!
    @user = fb_user_exist(user_info.email)

    if !(@user.nil?)

      #The user already exists. Either the existing user wants to link to fb or he has already linked through fb
      #we can signin this user if was created only through fb.
      sign_in @user
      redirect_back_or root_url
    else
      #we have to create a new user and update that db that this user was created through fb
      @user = User.new
      @user.name = user_info.name
      @user.email = user_info.email
      @user.fbflag = 1
      render 'users/new'
    end


  end

  def fb_user_exist(email)
     return  User.find_by_email(email)
  end

  private
  def setup_client
    @client = FBGraph::Client.new(:client_id => '313006152185371',:secret_id =>'92ff4e8f10d4b31dfdc6afb6a47f7a35')
  end

end
