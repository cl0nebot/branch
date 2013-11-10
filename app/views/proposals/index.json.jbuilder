json.array!(@proposals) do |proposal|
  json.extract! proposal, :subject, :body, :user_id, :upvotes, :downvotes, :confidence, :heat
  json.url proposal_url(proposal, format: :json)
end
