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
end
