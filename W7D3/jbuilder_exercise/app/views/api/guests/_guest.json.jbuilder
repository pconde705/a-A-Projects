
# json.partial! 'api/guests/guest', guest: @guest

json.extract! guest, :name, :age, :favorite_color
