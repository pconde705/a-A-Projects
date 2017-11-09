json.array!(@users) do |user|
  json.username(user.username)
  json.id(user.id)
  json.followed(current_user.follows?(user))
end
