class Admin::AdminController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :admin_auth
  def admin_auth
    authenticate_or_request_with_http_basic { |user_name, password| user_name == "kiipet" && password == "kiipet123456" }
  end
end
