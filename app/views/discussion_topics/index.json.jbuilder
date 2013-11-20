json.array!(@discussion_topics) do |discussion_topic|
  json.extract! discussion_topic, :user_id, :subject, :text, :upvotes, :downvotes, :heat, :confidence
  json.url discussion_topic_url(discussion_topic, format: :json)
end
