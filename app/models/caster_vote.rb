class CasterVote < ActiveRecord::Base
  belongs_to :endorser, :class_name => "Caster"
  belongs_to :caster, :counter_cache => :endorsements_count, :foreign_key => "recipient_id"
end