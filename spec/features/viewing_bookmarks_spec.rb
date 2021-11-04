
require 'spec_helper'

feature 'views bookmarks' do

  scenario 'user views homepage' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'  
  end

  scenario 'user views list of bookmarks' do

    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Add the test data
    Bookmarks.create(new_bookmark: 'http://www.makersacademy.com')
    Bookmarks.create(new_bookmark: 'http://www.destroyallsoftware.com')
    Bookmarks.create(new_bookmark: 'http://www.google.com')
    visit '/bookmarks'

    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.makersacademy.com"

  end
end

