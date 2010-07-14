class LoginsController < ApplicationController
  skip_before_filter :authenticate, :only => [:new, :create] 

  def new
    @user = User.new
    @user.login = params[:login]
  end

  def create
    if user = User.login(params[:user])
      session[:id] = user.id
      redirect_back(:controller => 'home', :action => 'show')
    else
      flash[:error] = 'Invalid login.'
      redirect_to :action => 'new', :login => params[:user][:login]
    end
  end

  def destroy
    reset_session
    flash[:message] = 'Logged out.'
    redirect_to :action => 'new'
  end

end
