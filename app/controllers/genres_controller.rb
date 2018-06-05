class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    Genre.create(genre_params)
    redirect_to genres_path
  end

  def show
    genre = Genre.find(params[:id])
    @movies = genre.movies
    @average = genre.average_rating
    @highest_rating = genre.highest_rating
    @highest_rated_movie = genre.movie_with_rating(@highest_rating)
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
