require 'rails_helper'

describe "user sees one movie" do
  it "user sees one with title and description" do
    director = Director.create(name: 'George Lucas')
    movie = director.movies.create(title:'Star Wars Episode 4', description: 'A New Hope')

    visit movie_path(movie.slug)

    expect(current_path).to eq("/movies/#{movie.slug}")

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.description)
  end

#   As a Visitor,
#   When I visit a movie show page,
#     I see genre names under a heading that says "Genres for this Movie:"
#       and the genres listed are only the genres associated with this movie.
#
# (for testing purposes, I should see at least 2 genres listed for a movie)
  it 'shows genres for the movie' do
    director = Director.create(name: 'George Lucas')
    movie = director.movies.create(title:'Star Wars Episode 4', description: 'A New Hope')
    genre1 = Genre.create(name: 'Sci-Fi')
    genre2 = Genre.create(name: 'Action')
    movie.genres << genre1
    movie.genres << genre2

    visit movie_path(movie.slug)

    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
  end
end
