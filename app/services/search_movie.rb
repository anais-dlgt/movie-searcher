require 'themoviedb'

class SearchMovie

  Tmdb::Api.key(Rails.application.credentials[:ma_super_cle])

  def initialize(search)
    @search = search
    @results = []

  end

  def perform
    @movies = Tmdb::Movie.find(@search)
    @movies.each do |movie|
    temp_hash = {}
    temp_hash[:poster_path] = movie.poster_path
    temp_hash[:title] = movie.title
    temp_hash[:release_date] = movie.release_date
    @results << temp_hash
    end
    @results
  end
end
