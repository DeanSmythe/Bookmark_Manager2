feature 'views bookmarks' do

  scenario 'user views list of bookmarks' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'  
  end

  before(each) do setup_database

  scenario 'user views list of bookmarks' do

    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    visit '/bookmarks'

    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.makersacademy.com"

  end
end

