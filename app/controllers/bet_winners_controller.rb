class BetWinnersController < ApplicationController
  before_action :set_bet_winner, only: [:show, :edit, :update, :destroy]

  def init
    #BetWinner.init
    redirect_to user_root_path
  end

  def bet
    bet = params[:bet_winner]
    bw = BetWinner.find_by user_id: current_user.id
    bw.winner_first = bet["winner_first"]
    bw.winner_second = bet["winner_second"]
    bw.winner_third = bet["winner_third"]
    bw.save

    respond_to do |format|
      format.html { redirect_to bet_winners_path, notice: 'c(￣▽￣) OK!' }
    end
  end

  def show_everyones
    @users = User.all.order("id")
  end

  # GET /bet_winners
  # GET /bet_winners.json
  def index
    @bet_winner = BetWinner.find_by user_id: current_user.id
    @countries = {"" => "", 
                 "ブラジル" => "BRA", 
                 "メキシコ" => "MEX", 
                 "オランダ" => "NLD", 
                 "チリ" => "CHL", 
                 "コロンビア" => "COL", 
                 "ギリシャ" => "GRC", 
                 "コスタリカ" => "CRI", 
                 "ウルグアイ" => "URY", 
                 "フランス" => "FRA", 
                 "スイス" => "CHE", 
                 "アルゼンチン" => "ARG", 
                 "ナイジェリア" => "NGA", 
                 "ドイツ" => "DEU", 
                 "アメリカ" => "USA", 
                 "ベルギー" => "BEL", 
                 "アルジェリア" => "DZA"}
  end

  # GET /bet_winners/1
  # GET /bet_winners/1.json
  def show
  end

  # GET /bet_winners/new
  def new
    @bet_winner = BetWinner.new
  end

  # GET /bet_winners/1/edit
  def edit
  end

  # POST /bet_winners
  # POST /bet_winners.json
  def create
    @bet_winner = BetWinner.new(bet_winner_params)

    respond_to do |format|
      if @bet_winner.save
        format.html { redirect_to @bet_winner, notice: 'Bet winner was successfully created.' }
        format.json { render :show, status: :created, location: @bet_winner }
      else
        format.html { render :new }
        format.json { render json: @bet_winner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bet_winners/1
  # PATCH/PUT /bet_winners/1.json
  def update
    respond_to do |format|
      if @bet_winner.update(bet_winner_params)
        format.html { redirect_to @bet_winner, notice: 'Bet winner was successfully updated.' }
        format.json { render :show, status: :ok, location: @bet_winner }
      else
        format.html { render :edit }
        format.json { render json: @bet_winner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bet_winners/1
  # DELETE /bet_winners/1.json
  def destroy
    @bet_winner.destroy
    respond_to do |format|
      format.html { redirect_to bet_winners_url, notice: 'Bet winner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bet_winner
      @bet_winner = BetWinner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bet_winner_params
      params.require(:bet_winner).permit(:winner_first, :winner_second, :winner_third)
    end
end
