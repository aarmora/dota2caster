class CasterFlagAddMore < ActiveRecord::Migration
  def change
    add_column :casters, :endorsements_count, :integer, :default => 0, :null => false
    add_column :casters, :comments_count, :integer, :default => 0, :null => false
    add_column :casters, :caster, :boolean, :default => false
    add_column :casters, :bio, :text   


  	create_table :caster_comments do |t|
  	  t.integer :commenter_id
  	  t.integer :recipient_id
  	  t.text :comment
  	  t.timestamps
  	end

    create_table :player_votes do |t|
      t.integer :voter_id
      t.integer :recipient_id
    end

  end
end
