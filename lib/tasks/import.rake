namespace :dota do
	task :import => :environment do
		require 'csv'

		fields_to_insert = %w{ name steam_id twitch email }
		rows_to_insert = []

		CSV.foreach("casters.csv", headers: true) do |row|
		  row_to_insert = row.to_hash.select { |k, v| fields_to_insert.include?(k) }
		  rows_to_insert << row_to_insert
		  caster = Caster.new
		  caster.name = row[0]
		  caster.steam_id = row[1]
		  caster.twitch = row[2]
		  caster.email = row[3]
		  caster.save!
		end	
		#puts rows_to_insert
	end
end