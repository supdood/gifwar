json.array!(@comments) do |comment|
  json.extract! comment, :id, :image_url, :body, :user_id, :battle_id, :comment_id
  json.url comment_url(comment, format: :json)
end
