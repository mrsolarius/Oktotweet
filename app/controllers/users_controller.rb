class UsersController < ApplicationController
  layout :resolve_layout
  before_action :set_user, only: %i[login show following followers edit update destroy file]

  # Login methode store user id in session
  def login
    session[:current_user_id] = @user.id
    respond_to do |format|
      format.html { redirect_to @user, notice: 'Vous êtes connecter' }
    end
  end

  # Logout methode to delete user id in session
  def logout
    session[:current_user_id] = nil
    respond_to do |format|
      format.html { redirect_to users_url, notice: "Vous êtes doconnecter" }
    end
  end

  # GET /users or /users.json
  def index
    @users = User.all
    @user = User.new
  end

  # GET /users/1
  def show; end

  # GET /user/1/following
  def following
    render 'show'
  end

  # GET /user/1/follower
  def followers
    render 'show'
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    unless @user.id == auth_user_id
      raise ActionController::MethodNotAllowed, 
            'Vous n\'êtes pas connecté ou vous tenter d\'éditer le compte d\'un autre utilisateur'
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "L'utilisateur a bien été créé." }
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
          format.html { redirect_to @user, notice: "L'utilisateur a été mis à jour" }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to tweets_url, notice: 'Vous ne pouvez pas modifier les autres utilisateurs' }
      end
    end
  end

  # DELETE /users/1
  def destroy
    respond_to do |format|
      if @user.id == auth_user_id
        @user.tweets.each(&:destroy)
        @user.destroy
        session[:current_user_id] = nil
        format.html { redirect_to users_url, notice: "Votre compte a été supprimer" }
      else
        format.html { redirect_to tweets_url, notice: 'Vous ne pouvez pas supprimer les comptes des autres utilisateurs' }
      end
    end
  end

  # GET /asset/users/1/profile
  def file
    if @user.imageB64?
      send_data(@user.imageB64, filename: @user.imageName, disposition: 'inline')
    else
      raise ActionController::RoutingError, 'Introuvable'
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
    when "new", "create", "index"
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
