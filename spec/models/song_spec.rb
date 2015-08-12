require'rails_helper'

describe Song do
	it "is valid with a title, album and artist" do
		song = Song.new(
			title: 'Gimme Shelter',
			album: 'Let It Bleed',
			artist: "Rolling Stones")
		expect(song).to be_valid
	end

	it "is invalid without a title" do
		song = Song.new(title: nil)
		song.valid?
		expect(song.errors[:title]).to include("can't be blank")
	end

	it "is invalid without a album" do
		song = Song.new(album: nil)
		song.valid?
		expect(song.errors[:album]).to include("can't be blank")
	end

	it "is invalid without a artist" do
		song = Song.new(artist: nil)
		song.valid?
		expect(song.errors[:artist]).to include("can't be blank")
	end

	
end