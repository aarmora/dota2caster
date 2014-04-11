class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #before_filter :load_user
  before_filter :check_active_streams
 	protect_from_forgery with: :null_session


  def check_active_streams
  	@twitch_accounts = ["amateurdota2league","amateurdota2league1", "bravenw_dota", "5midasgaming"]
    @active_streams = Rails.cache.fetch("active_twitch_streams", :expires_in => 1.seconds) do
       #+ Player.where(:caster => true).select{|p| p.twitch}.map {|p| p.twitch.split('/').last }.compact
      Twitch.streams.find(:channel => @twitch_accounts).select {|stream| stream.channel.game_name.downcase.include? "dota"}
    end
  end
end
