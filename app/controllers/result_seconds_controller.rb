class ResultSecondsController < ApplicationController
  before_action :set_result_second, only: [:show, :edit, :update, :destroy]

  def init
=begin
    sets = Array.new
    sets << "a,BRA/MEX"
    sets << "b,NLD/CHL"
    sets << "c,COL/GRC"
    sets << "d,CRI/URY"
    sets << "e,FRA/CHE"
    sets << "f,ARG/NGA"
    sets << "g,DEU/USA"
    sets << "h,BEL/DZA"

    ResultSecond.destroy_all
    sets.each do |s|
      val = s.split(",")
      rs = ResultSecond.new
      rs.group_name = val[0]
      rs.countries = val[1]
      rs.save
    end
=end
    redirect_to result_seconds_path
  end

  # GET /result_seconds
  # GET /result_seconds.json
  def index
    @result_seconds = ResultSecond.all
  end

  # GET /result_seconds/1
  # GET /result_seconds/1.json
  def show
  end

  # GET /result_seconds/new
  def new
    @result_second = ResultSecond.new
  end

  # GET /result_seconds/1/edit
  def edit
  end

  # POST /result_seconds
  # POST /result_seconds.json
  def create
    @result_second = ResultSecond.new(result_second_params)

    respond_to do |format|
      if @result_second.save
        format.html { redirect_to @result_second, notice: 'Result second was successfully created.' }
        format.json { render :show, status: :created, location: @result_second }
      else
        format.html { render :new }
        format.json { render json: @result_second.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /result_seconds/1
  # PATCH/PUT /result_seconds/1.json
  def update
    respond_to do |format|
      if @result_second.update(result_second_params)
        format.html { redirect_to @result_second, notice: 'Result second was successfully updated.' }
        format.json { render :show, status: :ok, location: @result_second }
      else
        format.html { render :edit }
        format.json { render json: @result_second.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /result_seconds/1
  # DELETE /result_seconds/1.json
  def destroy
    @result_second.destroy
    respond_to do |format|
      format.html { redirect_to result_seconds_url, notice: 'Result second was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result_second
      @result_second = ResultSecond.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_second_params
      params.require(:result_second).permit(:group_name, :countries)
    end
end
