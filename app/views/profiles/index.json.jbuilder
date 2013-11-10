json.array!(@profiles) do |profile|
  json.extract! profile, :user_id, :first_name, :last_name, :nickname, :middle_name, :summary, :city, :state
  json.url profile_url(profile, format: :json)
end
