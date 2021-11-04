require 'pg'

class Bookmarks

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test' )
    else
      conn = PG.connect( dbname: 'bookmark_manager' )
    end
    
    result = conn.exec('SELECT * FROM bookmarks;')
        result.map { |bookmark| bookmark['url']}
  end

  def self.create(new_bookmark:)

    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test' )
    else
      conn = PG.connect( dbname: 'bookmark_manager' )
    end
    conn.exec("INSERT INTO bookmarks (url) VALUES('#{new_bookmark}')")
  end

end