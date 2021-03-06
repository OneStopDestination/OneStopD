class ConstituenciesController < ApplicationController
  before_action :set_constituency, only: [:show, :edit, :update, :destroy]

  # GET /constituencies
  # GET /constituencies.json
  def index
    @constituencies = Constituency.all
  end

  # GET /constituencies/1
  # GET /constituencies/1.json
  def show
  end

  # GET /constituencies/new
  def new
    @constituency = Constituency.new
  end

  # GET /constituencies/1/edit
  def edit
  end

  # POST /constituencies
  # POST /constituencies.json
  def create
    @constituency = Constituency.new(constituency_params)

    respond_to do |format|
      if @constituency.save
        format.html { redirect_to @constituency, notice: 'Constituency was successfully created.' }
        format.json { render action: 'show', status: :created, location: @constituency }
      else
        format.html { render action: 'new' }
        format.json { render json: @constituency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /constituencies/1
  # PATCH/PUT /constituencies/1.json
  def update
    respond_to do |format|
      if @constituency.update(constituency_params)
        format.html { redirect_to @constituency, notice: 'Constituency was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @constituency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /constituencies/1
  # DELETE /constituencies/1.json
  def destroy
    @constituency.destroy
    respond_to do |format|
      format.html { redirect_to constituencies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_constituency
      @constituency = Constituency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def constituency_params
      params.require(:constituency).permit(:name, :cid, :current_MLA)
    end
end
