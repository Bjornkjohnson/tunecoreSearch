class SearchController < ApplicationController
  def index
  	if params[:search]
      @songs = Song.search(params[:search]).order("created_at DESC")
    else
      @songs = Song.order("created_at DESC")
    end
  end
end
