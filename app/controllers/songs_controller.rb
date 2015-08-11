class SongsController < ApplicationController
  def index
  	@songs = Song.text_search(params[:query])
  end

  def show
  end
end
