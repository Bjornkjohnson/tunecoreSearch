class Song < ActiveRecord::Base
	validates :title, :album, :artist, presence: true

	def self.text_search(query)
		if query.present?
			rank = <<-RANK
				ts_rank(to_tsvector(title), plainto_tsquery(#{sanitize(query)})) +
				ts_rank(to_tsvector(album), plainto_tsquery(#{sanitize(query)})) +
				ts_rank(to_tsvector(artist), plainto_tsquery(#{sanitize(query)}))
			RANK
			#query = query.split(" ").join(" | ")
			#to_tsquery(temp)query
			#where("title @@ to_tsquery(:q) or album @@ to_tsquery(:q) or artist @@ to_tsquery(:q)", q: query)
			where(":q @@ title or :q @@ album or :q @@ artist ", q: query).order("#{rank} desc")
		else
			all
		end
	end
end
