json.array!(@battles) do |battle|
  json.extract! battle, :id, :topic, :description, :created_by_id
  json.url battle_url(battle, format: :json)
end
