class PortalsController < ApplicationController
  before_action :set_porjal, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /portals
  # GET /portals.json
  def index
    @portals = Portal.all
    @users = User.all.order("id")
    @news_feeds = NewsFeed.order("id DESC").limit(12)

    @score_list = Array.new
    temp_list = Array.new
    users = User.all
    users.each do |u|
      score = BetFirst.get_score u.id
      score_2 = BetSecond.get_score u.id
      score_t16 = TournamentFirst.get_score u.id
      score = score + score_2 + score_t16
      score_info = Array.new
      score_info << u.user_info.name
      score_info << score.to_i
      temp_list << score_info
    end
    @score_list = temp_list.sort{|a,b|
      b[1] <=> a[1]
    }
  end

  # GET /portals/1
  # GET /portals/1.json
  def show
  end

  # GET /portals/new
  def new
    @portal = Portal.new
  end

  # GET /portals/1/edit
  def edit
  end

  # POST /portals
  # POST /portals.json
  def create
    @portal = Portal.new(portal_params)

    respond_to do |format|
      if @portal.save
        format.html { redirect_to @portal, notice: 'Portal was successfully created.' }
        format.json { render :show, status: :created, location: @portal }
      else
        format.html { render :new }
        format.json { render json: @portal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portals/1
  # PATCH/PUT /portals/1.json
  def update
    respond_to do |format|
      if @portal.update(portal_params)
        format.html { redirect_to @portal, notice: 'Portal was successfully updated.' }
        format.json { render :show, status: :ok, location: @portal }
      else
        format.html { render :edit }
        format.json { render json: @portal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portals/1
  # DELETE /portals/1.json
  def destroy
    @portal.destroy
    respond_to do |format|
      format.html { redirect_to portals_url, notice: 'Portal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portal
      @portal = Portal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portal_params
      params[:portal]
    end
end
