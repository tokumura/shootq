class ResultTnmtsecondsController < ApplicationController
  before_action :set_result_tnmtsecond, only: [:show, :edit, :update, :destroy]

  def init
    ResultTnmtsecond.init
    redirect_to user_root_path
  end

  # GET /result_tnmtseconds
  # GET /result_tnmtseconds.json
  def index
    @result_tnmtseconds = ResultTnmtsecond.all
  end

  # GET /result_tnmtseconds/1
  # GET /result_tnmtseconds/1.json
  def show
  end

  # GET /result_tnmtseconds/new
  def new
    @result_tnmtsecond = ResultTnmtsecond.new
  end

  # GET /result_tnmtseconds/1/edit
  def edit
  end

  # POST /result_tnmtseconds
  # POST /result_tnmtseconds.json
  def create
    @result_tnmtsecond = ResultTnmtsecond.new(result_tnmtsecond_params)

    respond_to do |format|
      if @result_tnmtsecond.save
        format.html { redirect_to @result_tnmtsecond, notice: 'Result tnmtsecond was successfully created.' }
        format.json { render :show, status: :created, location: @result_tnmtsecond }
      else
        format.html { render :new }
        format.json { render json: @result_tnmtsecond.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /result_tnmtseconds/1
  # PATCH/PUT /result_tnmtseconds/1.json
  def update
    respond_to do |format|
      if @result_tnmtsecond.update(result_tnmtsecond_params)
        format.html { redirect_to @result_tnmtsecond, notice: 'Result tnmtsecond was successfully updated.' }
        format.json { render :show, status: :ok, location: @result_tnmtsecond }
      else
        format.html { render :edit }
        format.json { render json: @result_tnmtsecond.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /result_tnmtseconds/1
  # DELETE /result_tnmtseconds/1.json
  def destroy
    @result_tnmtsecond.destroy
    respond_to do |format|
      format.html { redirect_to result_tnmtseconds_url, notice: 'Result tnmtsecond was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result_tnmtsecond
      @result_tnmtsecond = ResultTnmtsecond.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_tnmtsecond_params
      params.require(:result_tnmtsecond).permit(:match_code, :score_l, :score_r)
    end
end
