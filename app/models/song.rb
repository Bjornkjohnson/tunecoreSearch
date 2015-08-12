class Song < ActiveRecord::Base
	validates :title, :album, :artist, presence: true

	def self.text_search(query)
		if query.present?
			query = query.split(" ").join(" | ")
			#to_tsquery(temp)query
			where("title @@ to_tsquery(:q) or album @@ to_tsquery(:q) or artist @@ to_tsquery(:q)", q: query)
			#where(":q @@ title or :q @@ album or :q @@ artist ", q: query)
		else
			none
		end
	end
end
