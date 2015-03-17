class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :ensure_authentication

  def ensure_authentication
    redirect_to login_path, notice: "Faça o login para entrar no sistema, por favor." unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    session.delete(:user_id)
    nil
  end

  def get_date_time(date, time)
    DateTime.new(date.year, date.month, date.day, time.to_i)
  end
end
