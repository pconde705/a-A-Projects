

# json.extract! @guest, partial: 'api/guests/_guest'

json.partial! 'api/guests/guest', guest: @guest

json.gifts @guest.gifts do |gift|
  json.title gift.title
  json.description gift.description

end
