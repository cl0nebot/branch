json.array!(@comments) do |comment|
  json.extract! comment, :user_id, :parent_id, :parent_type, :body, :upvotes, :downvotes, :confidence, :heat
  json.url comment_url(comment, format: :json)
end
