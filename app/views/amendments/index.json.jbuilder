json.array!(@amendments) do |amendment|
  json.extract! amendment, :user_id, :proposal_id, :subject, :body, :upvotes, :downvotes, :confidence, :heat
  json.url amendment_url(amendment, format: :json)
end
