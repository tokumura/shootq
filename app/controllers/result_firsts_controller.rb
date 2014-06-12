class ResultFirstsController < ApplicationController
  before_action :set_result_first, only: [:show, :edit, :update, :destroy]

  def init
    ResultFirst.init
    redirect_to result_firsts_path
  end

  # GET /result_firsts
  # GET /result_firsts.json
  def index
    @result_firsts = ResultFirst.all.order("id")
  end

  # GET /result_firsts/1
  # GET /result_firsts/1.json
  def show
  end

  # GET /result_firsts/new
  def new
    @result_first = ResultFirst.new
  end

  # GET /result_firsts/1/edit
  def edit
  end

  # POST /result_firsts
  # POST /result_firsts.json
  def create
    @result_first = ResultFirst.new(result_first_params)

    respond_to do |format|
      if @result_first.save
        format.html { redirect_to @result_first, notice: 'Result first was successfully created.' }
        format.json { render :show, status: :created, location: @result_first }
      else
        format.html { render :new }
        format.json { render json: @result_first.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /result_firsts/1
  # PATCH/PUT /result_firsts/1.json
  def update
    respond_to do |format|
      if @result_first.update(result_first_params)
        format.html { redirect_to @result_first, notice: 'Result first was successfully updated.' }
        format.json { render :show, status: :ok, location: @result_first }
      else
        format.html { render :edit }
        format.json { render json: @result_first.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /result_firsts/1
  # DELETE /result_firsts/1.json
  def destroy
    @result_first.destroy
    respond_to do |format|
      format.html { redirect_to result_firsts_url, notice: 'Result first was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result_first
      @result_first = ResultFirst.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_first_params
      params.require(:result_first).permit(:match_date, :dayofweek, :match_time, :group_name, :match_code, :score_l, :score_r)
    end
end
