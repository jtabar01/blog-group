class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit

  helper_method :current_user
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

private
  #def initialize(user, record)
  #  raise Pundit::NotAuthorizedError, "must be logged in" unless user
  #  @user = user
  #  @record = record
  #end

  def current_user
    User.find(session[:current_user_id])
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
