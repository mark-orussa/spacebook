json.array!(@user) do |profile|
  json.extract! profile, :id, :fName, :lName, :age, :dob, :avatar, :comments
  json.url profile_url(profile, format: :json)
end
