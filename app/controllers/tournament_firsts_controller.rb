class TournamentFirstsController < ApplicationController
  before_action :set_tournament_first, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /tournament_firsts
  # GET /tournament_firsts.json
  def index
    @tournament_firsts = current_user.tournament_firsts.order("id")
  end

  def bet
    bet_data = params[:tournament_first]
    puts "###################"
    bet_data.each do |bet|
      b = bet[1]
      bf_obj = TournamentFirst.where("match_code = ? AND user_id = ?", b["match_code"], current_user.id.to_s).first
      puts bf_obj.match_code
      bf_obj.score_l = b["score_l"]
      bf_obj.score_r = b["score_r"]
      bf_obj.save!
    end
    puts "###################"
    respond_to do |format|
      format.html { redirect_to tournament_firsts_path, notice: 'c(￣▽￣) OK!' }
    end
  end

  def show_everyones
    @users = User.all.order("id")
    @matchs = current_user.tournament_firsts.order("id")
    @tournament_firsts = TournamentFirst.all.order("user_id")
    #@results = Hash.new
    #BetFirst.order("id").each do |r|
    #  @results.store(r.match_code, BetFirst.get_result_code(r.match_code))
    #end
  end

  def init
    #TournamentFirst.init
    redirect_to user_root_path
  end

  # GET /tournament_firsts/1
  # GET /tournament_firsts/1.json
  def show
  end

  # GET /tournament_firsts/new
  def new
    @tournament_first = TournamentFirst.new
  end

  # GET /tournament_firsts/1/edit
  def edit
  end

  # POST /tournament_firsts
  # POST /tournament_firsts.json
  def create
    @tournament_first = TournamentFirst.new(tournament_first_params)

    respond_to do |format|
      if @tournament_first.save
        format.html { redirect_to @tournament_first, notice: 'Tournament first was successfully created.' }
        format.json { render :show, status: :created, location: @tournament_first }
      else
        format.html { render :new }
        format.json { render json: @tournament_first.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournament_firsts/1
  # PATCH/PUT /tournament_firsts/1.json
  def update
    respond_to do |format|
      if @tournament_first.update(tournament_first_params)
        format.html { redirect_to @tournament_first, notice: 'Tournament first was successfully updated.' }
        format.json { render :show, status: :ok, location: @tournament_first }
      else
        format.html { render :edit }
        format.json { render json: @tournament_first.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournament_firsts/1
  # DELETE /tournament_firsts/1.json
  def destroy
    @tournament_first.destroy
    respond_to do |format|
      format.html { redirect_to tournament_firsts_url, notice: 'Tournament first was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament_first
      @tournament_first = TournamentFirst.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_first_params
      params.require(:tournament_first).permit(:match_code, :score_l, :score_r)
    end
end
