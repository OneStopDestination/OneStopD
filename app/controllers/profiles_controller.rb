class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
    print('inside the index function')
    Rails.logger.debug("debug::" + "-----------------------")
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
      #require 'rss'
      app = FbGraph::Application.new('313006152185371', :secret => '92ff4e8f10d4b31dfdc6afb6a47f7a35')
      token = app.get_access_token
      @posts = FbGraph::Page.new(597041733723317, :access_token =>token).posts
      #puts posts

      @profile = Profile.find(params[:id])
      @problem = Profile.find(params[:id]).problems.build(params[:problem])
      @opinion = Profile.find(params[:id]).opinions.build(params[:opinion])
      @opinionpoll = Opinionpoll.new(:constituency_id => @profile.constituency_id)
      #@problem = Problem.find(cid=Profile.find(id=1).constituency_id)
      #@problem_feed_items = @
      @problem_feed_items =  Profile.find(params[:id]).feed
      @opinion_feed_items =  Profile.find(params[:id]).opinions_feed
      puts(@problem_feed_items,"======================")

      #@rss = RSS::Parser.parse(open('https://www.facebook.com/feeds/page.php?id=597041733723317&format=rss20').read, false).items[0..3]
      #feed = Feedjira::Feed.fetch_and_parse('https://www.facebook.com/feeds/page.php?id=597041733723317&format=atom10')
      #@rss = Feedjira::Feed.fetch_and_parse('http://feedjira.com/blog/feed.xml')

      #puts("++++++++++++++++++++++++++++++++++++++++++FEEEEEEEEEEEEEEEEEEEEEED++++++++++")
      #puts(feed.entries )

  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    respond_to do |format|
      if !@profile.constituency_id.nil? && !@profile.user_id.nil? && @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:name, :education, :description, :manifesto, :pid, :user_id, :constituency_id ,:additional_details,:state,)
    end
end
