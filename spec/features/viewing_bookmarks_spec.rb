
require 'spec_helper'

feature 'views bookmarks' do

  scenario 'user views homepage' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'  
  end

  scenario 'user views list of bookmarks' do

    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Add the test data
    Bookmarks.create(title: 'Makers Academy', new_bookmark: 'http://www.makersacademy.com')
    Bookmarks.create(title: 'destroyallsoftware', new_bookmark: 'http://www.destroyallsoftware.com')
    Bookmarks.create(title: 'Google', new_bookmark: 'http://www.google.com')
    visit '/bookmarks'

    expect(page).to have_content "Makers Academy"
    expect(page).to have_content "destroyallsoftware"
    expect(page).to have_content "Google"

  end
end

