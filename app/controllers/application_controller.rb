class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
  	#user_groups_path(current_user.id)
  	channels_path
  end
end
