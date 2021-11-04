require 'pg'
require 'bookmarks'
require 'spec_helper'

describe 'Bookmarks' do
  it 'check all returns bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Add the test data
    Bookmarks.create(new_bookmark: 'http://www.makersacademy.com')
    Bookmarks.create(new_bookmark: 'http://www.destroyallsoftware.com')
    Bookmarks.create(new_bookmark: 'http://www.google.com')
    my_bookmarks = Bookmarks.all
  
    expect(my_bookmarks).to include('http://www.google.com')
    expect(my_bookmarks).to include('http://www.destroyallsoftware.com')
    expect(my_bookmarks).to include('http://www.makersacademy.com')
  end
end
