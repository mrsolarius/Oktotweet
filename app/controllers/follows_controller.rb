class FollowsController < ActionController::Base
  before_action :set_follow

  # follow an user if authenticate
  def follow
    # if not authenticate can't follow raise 400 error
    if @user_auth.nil?
      raise ActionController::MethodNotAllowed, 'Vous n\'êtes pas connecté'
    elsif @user_auth.id != @user_followed.id
      follow = Follow.new(follower_user_id: @user_auth.id, followed_user_id: @user_followed.id)
      if follow.save
        redirect_back fallback_location: '/', notice: "Vous avez bien follow #{@user_followed.name}"
      else
        redirect_back fallback_location: '/', error: "Impossible de follow l'utilisateur"
      end
    else
      redirect_back fallback_location: '/', error: 'Vous ne pouvez pas vous auto follow'
    end
  end

  # unfollow user if authenticate
  def unfollow
    if @user_auth.nil?
      raise ActionController::MethodNotAllowed, 'Vous n\'êtes pas connecté'
    elsif @user_auth.id != @user_followed.id
      follow = Follow.find_by(follower_user_id: @user_auth.id, followed_user_id:@user_followed.id)
      if follow.destroy
        redirect_back fallback_location: '/', notice: "Vous ne suivez plus #{@user_followed.name}"
      else
        redirect_back fallback_location: '/', error: "Impossible de follow l'utilisateur"
      end
    else
      redirect_back fallback_location: '/', error: 'Vous ne pouvez pas vous auto unfollow'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_follow
    @user_auth = auth_user
    @user_followed = User.find(params[:follow_user_id])
  end

  # Only allow a list of trusted parameters through.
  def follow_params
    params.require(:follow).permit(:follow_user_id)
  end

  # Get user object from session id
  def auth_user
    User.find(auth_user_id) unless auth_user_id.nil?
  end

  # get session of auth user
  def auth_user_id
    session[:current_user_id] unless session[:current_user_id].nil?
  end
end
