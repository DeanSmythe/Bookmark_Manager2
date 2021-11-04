
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base # Inherit
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:bookmarks)
  end

  post '/add_bookmark' do
    erb(:add_bookmark)
  end

  post '/bookmarks' do
    # Add the new bookmark to teh database
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
