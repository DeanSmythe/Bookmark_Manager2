require 'pg'
require 'bookmarks'
require 'spec_helper'

describe 'Bookmarks' do
  it 'check all returns bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Add the test data
    Bookmarks.create(title: 'Makers Academy', new_bookmark: 'http://www.makersacademy.com')
    Bookmarks.create(title: 'destroyallsoftware', new_bookmark: 'http://www.destroyallsoftware.com')
    Bookmarks.create(title: 'Google', new_bookmark: 'http://www.google.com')
    my_bookmarks = Bookmarks.all

    my_bookmarks.map! { |bookmark| bookmark[:title] }

    expect(my_bookmarks).to include "Makers Academy"
    expect(my_bookmarks).to include "destroyallsoftware"
    expect(my_bookmarks).to include "Google"
  end
end
