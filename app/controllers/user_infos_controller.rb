class UserInfosController < ApplicationController
  before_action :set_user_info, only: [:show, :edit, :update, :destroy]
  #before_filter :authenticate_user!

  def commit_voice
    user = User.where(account: params["account"].to_s).first
    voice = params["voice"].to_s
    user.user_info.voice = voice
    user.user_info.save
    redirect_to user_root_path
  end

  def init
    UserInfo.init
    redirect_to user_root_path
  end

  # GET /user_infos
  # GET /user_infos.json
  def index
    @user_infos = UserInfo.all
  end

  # GET /user_infos/1
  # GET /user_infos/1.json
  def show
  end

  # GET /user_infos/new
  def new
    @user_info = UserInfo.new
  end

  # GET /user_infos/1/edit
  def edit
  end

  # POST /user_infos
  # POST /user_infos.json
  def create
    @user_info = UserInfo.new(user_info_params)

    respond_to do |format|
      if @user_info.save
        format.html { redirect_to @user_info, notice: 'User info was successfully created.' }
        format.json { render :show, status: :created, location: @user_info }
      else
        format.html { render :new }
        format.json { render json: @user_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_infos/1
  # PATCH/PUT /user_infos/1.json
  def update
    if @user_info.update(user_info_params)
      redirect_to user_root_path
    else
      redirect_to user_root_path
    end
  end

  # DELETE /user_infos/1
  # DELETE /user_infos/1.json
  def destroy
    @user_info.destroy
    respond_to do |format|
      format.html { redirect_to user_infos_url, notice: 'User info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_info
      @user_info = UserInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_info_params
      params.require(:user_info).permit(:name, :voice, :point_first, :point_second, :point_third, :point_total)
    end
end
