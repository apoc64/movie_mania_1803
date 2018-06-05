require 'rails_helper'

describe Genre, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
  end
  describe "relationships" do
    it {should have_many(:movies).through(:genre_movies)}
  end

  describe 'instance methods' do
    it 'has average rating' do
      director = Director.create(name: 'George Lucas')
      genre = Genre.create(name: 'Sci-Fi')
      movie1 = director.movies.create(title:'Star Wars Episode 4', description: 'A New Hope', rating: 3)
      movie2 = director.movies.create(title:'Star Wars Episode 5', description: 'The Empire Strike Back', rating: 5)
      genre.movies << movie1
      genre.movies << movie2

      average = (movie1.rating + movie2.rating) / 2
      expect(genre.average_rating).to eq(average)
    end

    it 'has highest rating' do
      director = Director.create(name: 'George Lucas')
      genre = Genre.create(name: 'Sci-Fi')
      movie1 = director.movies.create(title:'Star Wars Episode 4', description: 'A New Hope', rating: 3)
      movie2 = director.movies.create(title:'Star Wars Episode 5', description: 'The Empire Strike Back', rating: 5)
      genre.movies << movie1
      genre.movies << movie2

      expect(genre.highest_rating).to eq(movie2.rating)
    end

    it 'has movie with rating' do
      director = Director.create(name: 'George Lucas')
      genre = Genre.create(name: 'Sci-Fi')
      movie1 = director.movies.create(title:'Star Wars Episode 4', description: 'A New Hope', rating: 3)
      movie2 = director.movies.create(title:'Star Wars Episode 5', description: 'The Empire Strike Back', rating: 5)
      genre.movies << movie1
      genre.movies << movie2

      expect(genre.movie_with_rating(3)).to eq(movie1.title)
    end
  end
end
