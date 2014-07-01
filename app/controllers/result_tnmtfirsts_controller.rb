class ResultTnmtfirstsController < ApplicationController
  before_action :set_result_tnmtfirst, only: [:show, :edit, :update, :destroy]

  def init
    #ResultTnmtfirst.init
    redirect_to user_root_path
  end

  # GET /result_tnmtfirsts
  # GET /result_tnmtfirsts.json
  def index
    @result_tnmtfirsts = ResultTnmtfirst.all
  end

  # GET /result_tnmtfirsts/1
  # GET /result_tnmtfirsts/1.json
  def show
  end

  # GET /result_tnmtfirsts/new
  def new
    @result_tnmtfirst = ResultTnmtfirst.new
  end

  # GET /result_tnmtfirsts/1/edit
  def edit
  end

  # POST /result_tnmtfirsts
  # POST /result_tnmtfirsts.json
  def create
    @result_tnmtfirst = ResultTnmtfirst.new(result_tnmtfirst_params)

    respond_to do |format|
      if @result_tnmtfirst.save
        format.html { redirect_to @result_tnmtfirst, notice: 'Result tnmtfirst was successfully created.' }
        format.json { render :show, status: :created, location: @result_tnmtfirst }
      else
        format.html { render :new }
        format.json { render json: @result_tnmtfirst.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /result_tnmtfirsts/1
  # PATCH/PUT /result_tnmtfirsts/1.json
  def update
    respond_to do |format|
      if @result_tnmtfirst.update(result_tnmtfirst_params)
        format.html { redirect_to @result_tnmtfirst, notice: 'Result tnmtfirst was successfully updated.' }
        format.json { render :show, status: :ok, location: @result_tnmtfirst }
      else
        format.html { render :edit }
        format.json { render json: @result_tnmtfirst.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /result_tnmtfirsts/1
  # DELETE /result_tnmtfirsts/1.json
  def destroy
    @result_tnmtfirst.destroy
    respond_to do |format|
      format.html { redirect_to result_tnmtfirsts_url, notice: 'Result tnmtfirst was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result_tnmtfirst
      @result_tnmtfirst = ResultTnmtfirst.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_tnmtfirst_params
      params.require(:result_tnmtfirst).permit(:match_code, :score_l, :score_r)
    end
end
