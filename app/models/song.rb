class Song < ActiveRecord::Base
	validates :title, :album, :artist, presence: true

	def self.text_search(query)
		if query.present?
			query = query.split(" ").join(" | ")
			rank = <<-RANK
				ts_rank(to_tsvector(title), to_tsquery(#{sanitize(query)})) +
				ts_rank(to_tsvector(album), to_tsquery(#{sanitize(query)})) +
				ts_rank(to_tsvector(artist), to_tsquery(#{sanitize(query)}))
			RANK
			k
			
			#to_tsquery(temp)query
			where("title @@ to_tsquery(:q) or album @@ to_tsquery(:q) or artist @@ to_tsquery(:q)", q: query).order("#{rank} DESC")
			#where(":q @@ title or :q @@ album or :q @@ artist ", q: query).order("#{rank} DESC")



		else
			all
		end
	end
end
