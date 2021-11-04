
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmarks'
require 'pg'

class BookmarkManager < Sinatra::Base # Inherit
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    p @bookmarks
    erb(:bookmarks)
  end

  post '/add_bookmark' do
    erb(:add_bookmark)
  end

  post '/bookmarks' do
    # p "back to bookmarks after data entry"
    # p params
    # Bookmarks.create( params[:add_new_bookmark] )
    # new_bookmark = params['add_new_bookmark']
    # p new_bookmark
    Bookmarks.create(new_bookmark: params['add_new_bookmark'])
    # conn = PG.connect( dbname: 'bookmark_manager' )
    # conn.exec("INSERT INTO bookmarks (url) VALUES('#{new_bookmark}')")
    # Add the new bookmark to the database
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
