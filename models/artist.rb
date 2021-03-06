require_relative('../db/sql_runner.rb')

class Artist

attr_reader :artist_name, :id

def initialize (params)
  @id = params['id'].to_i
  @artist_name = params['artist_name']
end

def Artist.all()
  sql = "SELECT * FROM artists"
  results = SqlRunner.run(sql)
  results.map {|artist| Artist.new (artist)}
end

def save()
  sql = "INSERT INTO artists (
    artist_name 
  ) VALUES (
    '#{@artist_name}'
  ) RETURNING id 
  "
  @id = SqlRunner.run(sql).first['id'].to_i
  # can you explain what the returning id require does a bit better please. I think that it means do the SQL command above and the result the id that SQl has assigned the data.
end

def album
  # sql = "SELECT b.title, a.artist_name FROM albums b INNER JOIN artists a ON a.id = b.artist WHERE b.artist = #{@id}"
#the sequel above will generate errors it is too specific. It will only give the title and artist name. We actually want it to return everything associated.
  sql = "SELECT b.* FROM albums b INNER JOIN artists a ON a.id = b.artist WHERE b.artist = #{@id}"
  results = SqlRunner.run( sql )
  return results.map{|album| Album.new (album)}
end

def Artist.find(id)
  sql = "SELECT * FROM artists WHERE id = #{id}"
  results = SqlRunner.run ( sql )
  return Artist.new (results.first())
end

def Artist.destroy(id)
  sql = "DELETE FROM artists WHERE id = #{id}"
  SqlRunner.run( sql )
end

def Artist.delete_all()
  sql = "DELETE FROM artists"
  SqlRunner.run(sql)
end

def Artist.count()
    sql = "SELECT * FROM artists"
    results = SqlRunner.run(sql)
    results.count
end
end