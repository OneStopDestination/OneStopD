class OpinionpollsController < ApplicationController
  before_action :set_opinionpoll, only: [:show, :edit, :update, :destroy]

  # GET /opinionpolls
  # GET /opinionpolls.json
  def index
    @opinionpolls = Opinionpoll.all
  end

  def index1
    @opinionpolls = Opinionpoll.all
    print "i came inside opinion polls!!!!!!!!!!!!!!!!!!!!!!!!"
  end

  # GET /opinionpolls/1
  # GET /opinionpolls/1.json
  def show
    @opinionpoll = Opinionpoll.find(params[:id])
    print "i came inside opinion polls show!!!!!!!!!!!!!!!!!!!!!!!!"
  end

  # GET /opinionpolls/new
  def new
    @opinionpoll = Opinionpoll.new
  end

  # GET /opinionpolls/1/edit
  def edit
  end

  # POST /opinionpolls
  # POST /opinionpolls.json
  def create
    @opinionpoll = Opinionpoll.new(opinionpoll_params)

    respond_to do |format|
      if @opinionpoll.save
        format.html { redirect_to @opinionpoll, notice: 'Opinionpoll was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @opinionpoll }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @opinionpoll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opinionpolls/1
  # PATCH/PUT /opinionpolls/1.json
  def update
    respond_to do |format|
      if @opinionpoll.update(opinionpoll_params)
        format.html { redirect_to @opinionpoll, notice: 'Opinionpoll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @opinionpoll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opinionpolls/1
  # DELETE /opinionpolls/1.json
  def destroy
    @opinionpoll.destroy
    respond_to do |format|
      format.html { redirect_to opinionpolls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opinionpoll
      @opinionpoll = Opinionpoll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opinionpoll_params
      params.require(:opinionpoll).permit(:description, :user_id_created, :user_id_voted, :option_selected, :options, :constituency_id ,:opinion_id)
    end
end
