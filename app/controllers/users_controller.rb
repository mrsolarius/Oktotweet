class UsersController < ApplicationController
  layout :resolve_layout
  before_action :set_user, only: %i[login show following followers edit update destroy file]

  def login
    session[:current_user_id] = @user.id
    respond_to do |format|
      format.html { redirect_to @user, notice: 'Vous êtes connecter' }
    end
  end

  # GET /users or /users.json
  def index
    @users = User.all
    @user = User.new
  end

  # GET /users/1
  def show; end

  def following
    render 'show'
  end

  def followers
    render 'show'
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    raise ActionController::MethodNotAllowed, 'Not Allowed' unless @user.id == auth_user_id
  end

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
      if @user.id == auth_user_id
        if @user.update(user_params)
          format.html { redirect_to @user, notice: "L'utilisateur à était mis à jour" }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to tweets_url, notice: 'Vous ne pouvez pas modifier les autres utilisateur' }
      end
    end
  end

  # DELETE /users/1
  def destroy
    respond_to do |format|
      if @user.id == auth_user_id
        @user.tweet.each(&:destroy)
        @user.destroy
        format.html { redirect_to users_url, notice: "Votre compte à était supprimer" }
      else
        format.html { redirect_to tweets_url, notice: 'Vous ne pouvez pas suprimer les compte des autres utilisateurs' }
      end
    end
  end

  # GET /asset/users/1/profile
  def file
    if @user.imageB64?
      send_data(@user.imageB64, filename: @user.imageName, disposition: 'inline')
    else
      raise ActionController::RoutingError, 'Not Found'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user_auth = auth_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:login, :name, :location, :bio, :profile_img)
  end

  def resolve_layout
    case action_name
    when "new", "create","index"
      "default"
    else
      "application"
    end
  end

  def auth_user
    if auth_user_id.nil?
      nil
    else
      User.find(auth_user_id)
    end
  end

  def auth_user_id
    session[:current_user_id] unless session[:current_user_id].nil?
  end
end
