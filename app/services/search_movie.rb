require 'themoviedb'

class SearchMovie

  Tmdb::Api.key(Rails.application.credentials[:ma_super_cle])

  def initialize(search)
    @search = search
    @array = []

  end

  def perform
    @movies = Tmdb::Movie.find(@search)
    @movies.each do |movie|
    temp_hash = {}
    director = Tmdb::Movie.director(movie.id)
    director_name = director.each { |director| movie[:director] = director.name } 
    puts "N/A"
    puts director
    puts "ahah"
      if credits["crew"["job"]] == "Director"
        director = credits["crew"]["name"]
      else
        director = "yapa"
      end
    temp_hash[:real] = director
    temp_hash[:poster_path] = movie.poster_path
    temp_hash[:title] = movie.title
    temp_hash[:release_date] = movie.release_date
    @array << temp_hash
    end
    @array
  end
end
