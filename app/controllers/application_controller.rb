class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  before_filter :authenticate, :current_user

  def redirect_away(*params)
    session[:original_uri] = request.request_uri
    redirect_to(*params)
  end

  def redirect_back(*params)
    uri = session[:original_uri]
    session[:original_uri] = nil
    if uri
      redirect_to uri
    else
      redirect_to(*params)
    end
  end

  private

  def authenticate
    unless session[:id]
      flash[:notice] = "You must be logged in"
      redirect_away(:action => 'new', :controller => 'login')
      return false
    end
  end

  def current_user
    @current_user ||= session[:id] &&
      User.find(session[:id])
  end
end
