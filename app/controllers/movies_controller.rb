class MoviesController < ApplicationController

  def new

  end

  def search
    @search = Tmdb::Search.new
    @movies = SearchMovie.new(movie: params["movie"]).perform
  end



end
