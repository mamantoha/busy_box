class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action { current_user }

  def index
  end

  private

  def current_user
    @current_user ||= User.find_by_id(cookies.signed[:user_id]) || create_session_user
  end

  def create_session_user
    user = User.create!
    cookies.signed[:user_id] = user.id
    user
  end
end
