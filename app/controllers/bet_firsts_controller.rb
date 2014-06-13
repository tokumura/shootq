class BetFirstsController < ApplicationController
  before_action :set_bet_first, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def init
    BetFirst.init
    redirect_to user_root_path
  end

  def show_everyones
    @users = User.all.order("id")
    @matchs = current_user.bet_firsts.order("id")
    @bet_firsts = BetFirst.all.order("user_id")
    @results = Hash.new
    BetFirst.order("id").each do |r|
      @results.store(r.match_code, BetFirst.get_result_code(r.match_code))
    end
  end

  def get_score
    BetFirst.get_score current_user.id
  end

  def show_ranking
    labels = ""
    bet_firsts = current_user.bet_firsts.order("id")
    bet_firsts.each_with_index do |b, i|
      labels = labels + b.match_code.to_s + ","
    end
    puts "###################"
    puts labels.split(',')
    puts "###################"
  end

  # GET /bet_firsts
  # GET /bet_firsts.json
  def index
    @bet_firsts = current_user.bet_firsts.order("id")
    #@bet_firsts = BetFirst.all
  end

  def bet
    bet_data = params[:bet_first]
    puts "###################"
    bet_data.each do |bet|
      b = bet[1]
      bf_obj = BetFirst.where("match_code = ? AND user_id = ?", b["match_code"], current_user.id.to_s).first
      puts bf_obj.match_code
      bf_obj.score_l = b["score_l"]
      bf_obj.score_r = b["score_r"]
      bf_obj.save!
    end
    puts "###################"
    respond_to do |format|
      format.html { redirect_to bet_firsts_path, notice: 'c(￣▽￣) OK!' }
    end
  end

  # GET /bet_firsts/1
  # GET /bet_firsts/1.json
  def show
  end

  # GET /bet_firsts/new
  def new
    @bet_first = BetFirst.new
  end

  # GET /bet_firsts/1/edit
  def edit
  end

  # POST /bet_firsts
  # POST /bet_firsts.json
  def create
    @bet_first = BetFirst.new(bet_first_params)

    respond_to do |format|
      if @bet_first.save
        format.html { redirect_to @bet_first, notice: 'Bet first was successfully created.' }
        format.json { render :show, status: :created, location: @bet_first }
      else
        format.html { render :new }
        format.json { render json: @bet_first.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bet_firsts/1
  # PATCH/PUT /bet_firsts/1.json
  def update
    respond_to do |format|
      if @bet_first.update(bet_first_params)
        format.html { redirect_to @bet_first, notice: 'Bet first was successfully updated.' }
        format.json { render :show, status: :ok, location: @bet_first }
      else
        format.html { render :edit }
        format.json { render json: @bet_first.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bet_firsts/1
  # DELETE /bet_firsts/1.json
  def destroy
    @bet_first.destroy
    respond_to do |format|
      format.html { redirect_to bet_firsts_url, notice: 'Bet first was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bet_first
      @bet_first = BetFirst.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bet_first_params
      params.require(:bet_first).permit(:match_code, :score, :user_id)
    end
end
