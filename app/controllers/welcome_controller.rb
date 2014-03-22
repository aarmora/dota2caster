class WelcomeController < ApplicationController
  def index
  end
  
  def auth_callback
    auth = request.env['omniauth.auth']
    session[:current_user] = { 
    	:nickname => auth.info['nickname'],
      :image => auth.extra.raw_info['avatar'],
      :uid => auth.uid
    }
  end

  def logout
      reset_session
      redirect_to :controller => 'welcome'
  end
end
