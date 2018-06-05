require 'rails_helper'

describe 'visitor_sees_genre_show' do
# As a Visitor,
#   When I visit a genre show page,
#     I see all movies associated with that genre listed on the page.
#
# (for testing purposes, I should see at least 2 movies listed for a genre)
  it 'shows all movies for genre' do
    director = Director.create(name: 'George Lucas')
    genre = Genre.create(name: 'Sci-Fi')
    movie1 = director.movies.create(title:'Star Wars Episode 4', description: 'A New Hope')
    movie2 = director.movies.create(title:'Star Wars Episode 5', description: 'The Empire Strike Back')
    genre.movies << movie1
    genre.movies << movie2

    visit genre_path(genre)

    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie2.title)
  end
#   As a Visitor,
#   When I visit a genre show page,
#     I see the average rating for all movies in this genre
#
# (for testing purposes, I should add at least 2 movies for a genre)
  it 'shows average rating for movies' do
    director = Director.create(name: 'George Lucas')
    genre = Genre.create(name: 'Sci-Fi')
    movie1 = director.movies.create(title:'Star Wars Episode 4', description: 'A New Hope', rating: 3)
    movie2 = director.movies.create(title:'Star Wars Episode 5', description: 'The Empire Strike Back', rating: 5)
    genre.movies << movie1
    genre.movies << movie2

    visit genre_path(genre)

    average = (movie1.rating + movie2.rating) / 2
    expect(page).to have_content("Average Rating: #{average}")
  end
#   As a Visitor,
#   When I visit a genre show page,
#     I see the name and rating of the movie with the highest rating of all movies in this genre
#
# (for testing purposes, I should add at least 2 movies for a genre)
  it 'shows the highest rated movie and rating' do
    director = Director.create(name: 'George Lucas')
    genre = Genre.create(name: 'Sci-Fi')
    movie1 = director.movies.create(title:'Star Wars Episode 4', description: 'A New Hope', rating: 3)
    movie2 = director.movies.create(title:'Star Wars Episode 5', description: 'The Empire Strike Back', rating: 5)
    genre.movies << movie1
    genre.movies << movie2

    visit genre_path(genre)

    expect(page).to have_content("Highest Rated: #{movie2.title}, #{movie2.rating}")
  end
  # As a Visitor,
  # When I visit a genre show page,
  #   I see the name and rating of the movie with the lowest rating of all movies in this genre
  it 'shows the lowest rated movie and rating' do
    director = Director.create(name: 'George Lucas')
    genre = Genre.create(name: 'Sci-Fi')
    movie1 = director.movies.create(title:'Star Wars Episode 4', description: 'A New Hope', rating: 3)
    movie2 = director.movies.create(title:'Star Wars Episode 5', description: 'The Empire Strike Back', rating: 5)
    genre.movies << movie1
    genre.movies << movie2

    visit genre_path(genre)

    expect(page).to have_content("Lowest Rated: #{movie1.title}, #{movie1.rating}")
  end
end
