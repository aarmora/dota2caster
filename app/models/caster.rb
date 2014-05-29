class Caster < ActiveRecord::Base


  # Endorsers are people who "voted" for this person. Endorsed players are people this user voted for
  has_many :endorsements, :class_name => "CasterVote", :foreign_key => "recipient_id", :dependent => :delete_all
  has_many :endorsers, :through => :endorsements
  has_many :outgoing_endorsements, :class_name => "CasterVote", :foreign_key => "endorser_id", :dependent => :delete_all

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