class Caster < ActiveRecord::Base

  def is_admin?
  	# TODO: Move into an ENV config?
  	#                  Rasputin
  	steam_ids = ["76561198040889152"]
  	steam_ids.include? self.steam_id
  end

  def permission_role
  	if self.is_admin?
  		:admin
  	else
  		:default
  	end
  end
end