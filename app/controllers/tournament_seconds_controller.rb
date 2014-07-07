class TournamentSecondsController < ApplicationController
  before_action :set_tournament_second, only: [:show, :edit, :update, :destroy]

  def init
    #TournamentSecond.init
    redirect_to user_root_path
  end

  def init_semifinal
    #TournamentSecond.init_semifinal
    redirect_to user_root_path
  end

  def bet
    bet_data = params[:tournament_second]
    bet_data.each do |bet|
      b = bet[1]
      bf_obj = TournamentSecond.where("match_code = ? AND user_id = ?", b["match_code"], current_user.id.to_s).first
      puts bf_obj.match_code
      bf_obj.score_l = b["score_l"]
      bf_obj.score_r = b["score_r"]
      bf_obj.save!
    end
    respond_to do |format|
      format.html { redirect_to tournament_seconds_path, notice: 'c(￣▽￣) OK!' }
    end
  end

  def show_everyones
    @users = User.all.order("id")
    @matchs = current_user.tournament_seconds.order("id")
    @tournament_seconds = TournamentSecond.all.order("user_id")
    @results = Hash.new
    ResultTnmtsecond.order("id").each do |r|
      @results.store(r.match_code, TournamentSecond.get_result_code(r.match_code))
    end
  end

  # GET /tournament_seconds
  # GET /tournament_seconds.json
  def index
    @stage = params["stage"].to_s
    if @stage == "semifinal"
      @tournament_seconds = TournamentSecond.where("(match_code = ? OR match_code = ?) AND user_id = ?", "BRA-DEU", "NLD-ARG", current_user.id).order("id")
    elsif @stage == "final"
    else
      @tournament_seconds = TournamentSecond.where("(match_code != ? AND match_code != ?) AND user_id = ?", "BRA-DEU", "NLD-ARG", current_user.id).order("id")
    end
  end

  # GET /tournament_seconds/1
  # GET /tournament_seconds/1.json
  def show
  end

  # GET /tournament_seconds/new
  def new
    @tournament_second = TournamentSecond.new
  end

  # GET /tournament_seconds/1/edit
  def edit
  end

  # POST /tournament_seconds
  # POST /tournament_seconds.json
  def create
    @tournament_second = TournamentSecond.new(tournament_second_params)

    respond_to do |format|
      if @tournament_second.save
        format.html { redirect_to @tournament_second, notice: 'Tournament second was successfully created.' }
        format.json { render :show, status: :created, location: @tournament_second }
      else
        format.html { render :new }
        format.json { render json: @tournament_second.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournament_seconds/1
  # PATCH/PUT /tournament_seconds/1.json
  def update
    respond_to do |format|
      if @tournament_second.update(tournament_second_params)
        format.html { redirect_to @tournament_second, notice: 'Tournament second was successfully updated.' }
        format.json { render :show, status: :ok, location: @tournament_second }
      else
        format.html { render :edit }
        format.json { render json: @tournament_second.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournament_seconds/1
  # DELETE /tournament_seconds/1.json
  def destroy
    @tournament_second.destroy
    respond_to do |format|
      format.html { redirect_to tournament_seconds_url, notice: 'Tournament second was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament_second
      @tournament_second = TournamentSecond.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_second_params
      params.require(:tournament_second).permit(:match_code, :score_l, :score_r, :user_id)
    end
end
