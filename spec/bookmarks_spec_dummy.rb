require 'pg'
require 'bookmarks'

describe 'Bookmarks' do
  if 'check all returns bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    my_bookmarks = Bookmark.all

    expect(my_bookmarks.all).to include('http://www.google.com')
    expect(my_bookmarks.all).to include('http://www.destroyallsoftware.com')
    expect(my_bookmarks.all).to include('http://www.makersacademy.com')
  end
end

 
end