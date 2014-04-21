class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :load_user
  before_filter :check_active_streams
 	protect_from_forgery with: :null_session


  def load_user
    # In rails 4, this would be .find_or_create_by! (:steamid => session[:current_user][:uid])
    @current_user = Caster.find_or_create_by! :steam_id => session[:current_user][:uid] if session[:current_user]
    # If they are a new user, ship them over to the profile page
    if @current_user && @current_user.new_record?
      @current_user.save!
      redirect_to @current_user
    elsif @current_user
      Caster.find(@current_user.id).update_attributes(:name => session[:current_user][:nickname])
    end

    @can_edit = @current_user && @current_user.is_admin?

  end

  def check_active_streams
  	@twitch_accounts = ["amateurdota2league","amateurdota2league1", "bravenw_dota"]
    @active_streams = Rails.cache.fetch("active_twitch_streams", :expires_in => 1.seconds) do
       #+ Player.where(:caster => true).select{|p| p.twitch}.map {|p| p.twitch.split('/').last }.compact
      Twitch.streams.find(:channel => @twitch_accounts).select {|stream| stream.channel.game_name.downcase.include? "dota"}
    end
  end
end
