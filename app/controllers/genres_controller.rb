class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def show
    genre = Genre.find(params[:id])
    @movies = genre.movies
    @average = genre.average_rating
    @highest_rating = genre.highest_rating
    @highest_rated_movie = genre.movie_with_rating(@highest_rating)
    @lowest_rating = genre.lowest_rating
    @lowest_rated_movie = genre.movie_with_rating(@lowest_rating)
  end
end
