class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy file ]

  # GET /users or /users.json
  def index
    @users = User.all
    @user = User.new
  end

  # GET /users/1
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "L'utilisateur à bien était crée." }
      else
        @users = User.all
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "L'utilisateur à était mis à jour" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "L'utilisateur à bien était suprimer." }
    end
  end

  # GET /asset/users/1/profile
  def file
    if @user.imageB64?
      send_data(@user.imageB64, filename: @user.imageName, disposition: "inline")
    else
      raise ActionController::RoutingError, 'Not Found'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:login, :name, :location, :bio, :profile_img)
  end
end
