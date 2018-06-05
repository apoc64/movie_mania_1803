require 'rails_helper'

describe 'visitor visits genre index' do
  # As a Visitor,
  #   When I visit the genre index page,
  #     I cannot see the form to create new genres,
  #     I see all genres in the database
  #       And each genre's name should be a link to that genre's show page.
  #
  # (for testing purposes, I should see at least 2 genres listed)
  it 'shows genre links with no form' do
    genre1 = Genre.create(name: 'Action')
    genre2 = Genre.create(name: 'Comedy')
    user = User.create(username: "Dee", password: "password", role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit genres_path

    expect(page).to_not have_button("Create Genre")
    expect(page).to have_link(genre1.name)
    expect(page).to have_link(genre2.name)
  end
end
