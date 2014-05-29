class CastersController < ApplicationController

	def index
		
	end
	def show
		@caster = Caster.find(params[:id])

		@can_edit_self = @current_user && (@current_user == @caster || @current_user.is_admin?)

	end

  def update
    raise ActionController::RoutingError.new('Not Found') unless @current_user && (params[:id].to_i == @current_user.id || @current_user.is_admin?)
    @caster = Caster.find(params[:id])
    respond_to do |format|
      if @caster.update_attributes(params.require(:caster).permit(:email, :twitch, :email_flag, :caster, :youtube, :twitter))
        format.html { redirect_to(@caster, :notice => 'Caster was successfully updated.') }
        format.json { respond_with_bip(@caster) }
      else
        format.html { render :action => "show" }
        format.json { respond_with_bip(@caster) }
      end
    end
  end

  def endorse
    if @current_user
      @caster = Caster.find(params[:id])
      if params[:endorse].to_i == 1
        @caster.endorsers << @current_user
      else
        @caster.endorsers.delete(@current_user)
      end
    end

    respond_to do |format|
      format.html { redirect_to(@caster) }
      format.json { render :json => {:endorsed => params[:endorse].to_i == 1} }
    end
  end

end
