require_relative('../db/sql_runner.rb')

class Genre

attr_reader :genre_name, :id

def initialize(params)
  @id = params['id'].to_i
  @genre_name = params['genre_name']
end

def Genre.all()
  sql = "SELECT * FROM genres"
  results = SqlRunner.run ( sql )
  results.map {|genre| Genre.new (genre)} 
end

def save()
  sql = "INSERT INTO genres (
    genre_name 
  ) VALUES (
    '#{@genre_name}'
  ) RETURNING id 
  "
  @id = SqlRunner.run(sql).first['id'].to_i
end

def Genre.destroy(id)
  sql = "DELETE FROM genres WHERE id = #{id}"
  SqlRunner.run ( sql )
end

def Genre.delete_all()
  sql = "DELETE FROM genres"
  SqlRunner.run(sql)
end

def Genre.find(id)
  sql = "SELECT * FROM genres WHERE id = #{id}"
  results = SqlRunner.run(sql)
  return Genre.new (results.first())
end

def Genre.count
  sql = "SELECT * FROM genres"
  results = SqlRunner ( sql )
  results.count()
end

def album()
  sql = "SELECT b.* FROM albums b INNER JOIN genres g ON g.id = b.genre WHERE b.genre = #{@id}" 
  results = SqlRunner.run( sql )
  return results.map{|album| Album.new (album)}
end

end