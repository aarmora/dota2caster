class WelcomeController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :auth_callback

  
  def index
    @casters = Caster.all
  end

  def show
  end
  
  def personal
  end
  
  def auth_callback
    auth = request.env['omniauth.auth']
    session[:current_user] = { 
    	:nickname => auth.info['nickname'],
      :image => auth.extra.raw_info['avatar'],
      :uid => auth.uid
    }
    
    redirect_to root_path
  end

  def logout
      reset_session
      redirect_to :controller => 'welcome'
  end
end
