require 'pg'

class Bookmarks

  def self.all
    @bookmarks = []
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager' )
    else
      conn = PG.connect( dbname: 'bookmark_manager_test' )
    end

    conn.exec( "SELECT * FROM bookmarks" ) do |result|    
      result.each do |row|
        puts row
        @bookmarks << row['url']
      end
    end
  end
end