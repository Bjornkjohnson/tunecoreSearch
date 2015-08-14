require "net/http"
require 'json'
require "uri"

def callApi(thing)
	uri = URI(thing)
	get = Net::HTTP.get(uri)
	JSON.parse(get)
end

def get_track_names(j)
	totalTracks =  j["tracks"]["total"].to_i
	for i in 0...totalTracks
		Song.create!(title:  	j["tracks"]["items"][i]["name"],
             album: 	j["name"],
             artist: 	j["artists"][0]["name"])
	end
end

def get_album_names(j)
	prev = ""
	for i in 0...j["total"]-1
		if prev != j["items"][i]["name"].split(" ").first
			album = 'https://api.spotify.com/v1/albums/' + j["items"][i]['id']
			k  = callApi(album)
			get_track_names(k)
		end
		prev = j["items"][i]["name"].split(" ").first
	end
end


acdc = 'https://api.spotify.com/v1/search?q=acdc&type=artist'
faces = 'https://api.spotify.com/v1/search?q=faces&type=artist'
fugazi = 'https://api.spotify.com/v1/search?q=fugazi&type=artist'
iggy = 'https://api.spotify.com/v1/search?q=iggy%20pop&type=artist'
lizzy = 'https://api.spotify.com/v1/search?q=thin%20lizzy&type=artist'
maiden = 'https://api.spotify.com/v1/search?q=iron%20maiden&type=artist'
ramones = 'https://api.spotify.com/v1/search?q=ramones&type=artist'
sabbath = 'https://api.spotify.com/v1/search?q=black%20sabbath&type=artist'
stones = 'https://api.spotify.com/v1/search?q=rolling%20stones&type=artist'
velvets = 'https://api.spotify.com/v1/search?q=velvet%20underground&type=artist'

artists = [acdc, faces, fugazi, iggy, lizzy, maiden, ramones,sabbath, stones, velvets]
artists.each do |x| 
	#searches for artist and finds all albums
	j  = callApi(x)
	artistPath = j["artists"]["items"][0]["href"] + '/albums' + '?offset=0&limit=50&album_type=album&market=US'
	#get specific album
	j  = callApi(artistPath)
	get_album_names(j)
end




