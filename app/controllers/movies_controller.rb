class MoviesController < ApplicationController

  def new

  end

  def search
    @results = SearchMovie.new(params[:movie]).perform
  end



end
