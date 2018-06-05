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
    @average = @movies.average(:rating)
    @highest_rating = @movies.maximum(:rating)
    @highest_rated_movie = @movies.where(rating: @highest_rating).first.title
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
