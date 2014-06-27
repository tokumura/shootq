class BetSecondsController < ApplicationController
  before_action :set_bet_second, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /bet_seconds
  # GET /bet_seconds.json
  def index
    @bet_second = BetSecond.find_by user_id: current_user.id
    @group_a = {"ブラジル" => "BRA", "クロアチア" => "HRV", "メキシコ" => "MEX", "カメルーン" => "CME"}
    @group_b = {"スペイン" => "ESP", "オランダ" => "NLD", "チリ" => "CHL", "オーストラリア" => "AUS"}
    @group_c = {"コロンビア" => "COL", "ギリシャ" => "GRC", "コートジボワール" => "CIV", "日本" => "JPN"}
    @group_d = {"ウルグアイ" => "URY", "コスタリカ" => "CRI", "イングランド" => "ENG", "イタリア" => "ITA"}
    @group_e = {"スイス" => "CHE", "エクアドル" => "ECU", "フランス" => "FRA", "ホンジュラス" => "HND"}
    @group_f = {"アルゼンチン" => "ARG", "ボスニアヘルチェゴビナ" => "BIH", "イラン" => "IRN", "ナイジェリア" => "NGA"}
    @group_g = {"ドイツ" => "DEU", "ポルトガル" => "PRT", "ガーナ" => "GHA", "アメリカ" => "USA"}
    @group_h = {"ベルギー" => "BEL", "アルジェリア" => "DZA", "ロシア" => "RUS", "韓国" => "KOR"}
  end

  def show_everyones
    @users = User.all.order("id")
  end

  def bet
    bet = params[:bet_second]
    bs = BetSecond.find_by user_id: current_user.id
    bs.a1 = bet["a1"]
    bs.a2 = bet["a2"]
    bs.b1 = bet["b1"]
    bs.b2 = bet["b2"]
    bs.c1 = bet["c1"]
    bs.c2 = bet["c2"]
    bs.d1 = bet["d1"]
    bs.d2 = bet["d2"]
    bs.e1 = bet["e1"]
    bs.e2 = bet["e2"]
    bs.f1 = bet["f1"]
    bs.f2 = bet["f2"]
    bs.g1 = bet["g1"]
    bs.g2 = bet["g2"]
    bs.h1 = bet["h1"]
    bs.h2 = bet["h2"]
    bs.save

    respond_to do |format|
      format.html { redirect_to bet_seconds_path, notice: 'c(￣▽￣) OK!' }
    end
  end

  def init
    BetSecond.init
    redirect_to bet_seconds_path
  end

  # GET /bet_seconds/1
  # GET /bet_seconds/1.json
  def show
  end

  # GET /bet_seconds/new
  def new
    @bet_second = BetSecond.new
  end

  # GET /bet_seconds/1/edit
  def edit
  end

  # POST /bet_seconds
  # POST /bet_seconds.json
  def create
    @bet_second = BetSecond.new(bet_second_params)

    respond_to do |format|
      if @bet_second.save
        format.html { redirect_to @bet_second, notice: 'Bet second was successfully created.' }
        format.json { render :show, status: :created, location: @bet_second }
      else
        format.html { render :new }
        format.json { render json: @bet_second.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bet_seconds/1
  # PATCH/PUT /bet_seconds/1.json
  def update
    respond_to do |format|
      if @bet_second.update(bet_second_params)
        format.html { redirect_to @bet_second, notice: 'Bet second was successfully updated.' }
        format.json { render :show, status: :ok, location: @bet_second }
      else
        format.html { render :edit }
        format.json { render json: @bet_second.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bet_seconds/1
  # DELETE /bet_seconds/1.json
  def destroy
    @bet_second.destroy
    respond_to do |format|
      format.html { redirect_to bet_seconds_url, notice: 'Bet second was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bet_second
      @bet_second = BetSecond.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bet_second_params
      params.require(:bet_second).permit(:a1, :a2, :b1, :b2, :c1, :c2, :d1, :d2, :e1, :e2, :f1, :f2, :g1, :g2, :h1, :h2, :user_id)
    end
end
