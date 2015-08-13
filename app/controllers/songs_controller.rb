class SongsController < ApplicationController
  def index
  	@songs = Song.text_search(params[:query]).paginate(:page => params[:page], :per_page => 15)
  end

  def show
  end
end
