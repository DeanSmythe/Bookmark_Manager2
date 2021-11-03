require 'pg'

  conn = PG.connect( dbname: 'bookmark_manager_test' )
  conn.exec( "TRUNCATE TABLE bookmarks" )

