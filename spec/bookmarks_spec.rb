require 'pg'
require 'bookmarks'
require 'spec_helper'

describe 'Bookmarks' do
  it 'check all returns bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Add the test data
    # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
    # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
    Bookmarks.create(new_bookmark: 'http://www.makersacademy.com')
    Bookmarks.create(new_bookmark: 'http://www.destroyallsoftware.com')
    Bookmarks.create(new_bookmark: 'http://www.google.com')
    my_bookmarks = Bookmarks.all
  
    expect(my_bookmarks).to include('http://www.google.com')
    expect(my_bookmarks).to include('http://www.destroyallsoftware.com')
    expect(my_bookmarks).to include('http://www.makersacademy.com')
  end
end
