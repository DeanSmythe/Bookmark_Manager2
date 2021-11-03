require 'pg'

class Bookmarks

  @bookmarks = []

  conn = PG.connect( dbname: 'bookmark_manager' )
  conn.exec( "SELECT * FROM bookmarks" ) do |result|
    result.each do |row|
      @bookmarks << row['url']
    end
  end


  def self.all
    @bookmarks
  end

end