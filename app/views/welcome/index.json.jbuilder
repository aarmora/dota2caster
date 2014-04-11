
json.array!(@casters) do |caster|
  json.extract! caster, :id, :name, :twitch, :steam_id
end