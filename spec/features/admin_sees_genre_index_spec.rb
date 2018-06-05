require 'rails_helper'

describe 'admin visits genre index' do
# As an admin user,
#   When I visit the genre index page,
#   I see a list of all genre names in the database.
#
# (for testing purposes, I should see at least 2 genres listed)
  it 'shows all genre names' do
    genre1 = Genre.create(name: 'Action')
    genre2 = Genre.create(name: 'Comedy')
    admin = User.create(username: "Dee", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit genres_path

    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
  end

  # As an admin user,
  # When I visit the genre index page,
  # I see a form to create a new genre.
  it 'shows a form to create new genre' do
    admin = User.create(username: "Dee", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit genres_path
    expect(page).to have_button("Create Genre")
  end
  # As an admin user,
  # When I visit the genre index page,
  # And I fill out the form with a genre's name and click 'Create Genre',
  # I return to the genre index page,
  # I see all genre names from the database including the new genre I have just created.
  it 'can create a new genre' do
    genre1 = Genre.create(name: 'Action')
    genre2 = Genre.create(name: 'Comedy')
    admin = User.create(username: "Dee", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit genres_path

    name = 'Sci-Fi'
    fill_in 'genre[name]', with: name
    click_on 'Create Genre'

    expect(current_path).to eq(genres_path)
    expect(page).to have_content(name)
    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
  end
end
