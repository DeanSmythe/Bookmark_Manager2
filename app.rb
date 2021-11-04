
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
    Bookmarks.create(new_bookmark: params['add_new_bookmark'], title: params['add_new_title'])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
