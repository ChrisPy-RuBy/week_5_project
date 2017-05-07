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

def Artist.delete()
  sql = "DELETE FROM artists"
  SqlRunner.run(sql)
end

end