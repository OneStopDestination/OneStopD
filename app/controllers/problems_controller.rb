class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :edit, :update, :destroy]
  helper :Problems
  # GET /problems
  # GET /problems.json
  def index
    @problems = Problem.all
  end

  # GET /problems/1
  # GET /problems/1.json
  def show

  end

  # GET /problems/new
  def new
    @problem = Problem.new
  end

  # GET /problems/1/edit
  def edit
  end

  # POST /problems
  # POST /problems.json
  def create
    @problem = Problem.new(problem_params)
    @politician = User.find_by_email(Profile.find_by_constituency_id(@problem.cid).user_id)
    respond_to do |format|
      if @problem.save
        UserMailer.problem_notification(@politician).deliver
        format.html   {
          flash[:success] = "Problem created!"
          redirect_back_or(root_url)
        }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /problems/1
  # PATCH/PUT /problems/1.json
  def update
    @problem.update(problem_params)
    respond_to do |format|
      format.html { redirect_back_or(root_url) }
      format.js
    end
  end

  # DELETE /problems/1
  # DELETE /problems/1.json
  def destroy
    @problem.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem
      @problem = Problem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def problem_params
      params.require(:problem).permit(:cid, :category, :resolved, :user_id_posted, :user_id_resolved, :rating, :resolution , :description)
    end
end
