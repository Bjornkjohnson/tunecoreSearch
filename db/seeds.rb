# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Song.create!(title:  	"Sympathy for the Devil",
             album: 	"Beggars Banquet",
             artist: 	"The Rolling Stones")

Song.create!(title:  	"Rip This Joint",
             album: 	"Exile on Main Street",
             artist: 	"The Rolling Stones")

499.times do |n|
  title  = "title-#{n+1}"
  album = "album-#{n+1}"
  artist = "artist-#{n+1}"
  Song.create!(title:  title,
               album: album,
               artist: artist)
end
