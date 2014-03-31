class AddCasterTable < ActiveRecord::Migration
  def change
	create_table :casters do |t|
	  t.string :name
	  t.integer :steam_id
	  t.string :twitch
	  t.string :youtube
	  t.string :twitter
	  t.string :email
	  t.boolean :email_flag
	  t.timestamps
	end
  end
end
