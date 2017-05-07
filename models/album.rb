require_relative('../db/sql_runner.rb')

class Album

attr_reader :id, :title, :artist, :genre, :release_year, :buy_price, :sell_price, :number_in_stock, :number_on_order

def initialize (params)
  @id = params['id'].to_i
  @title = params['title']
  @artist = params['artist'].to_i
  @genre = params['genre'].to_i
  @release_year = params['release_year']
  @buy_price = params['buy_price'].to_i
  @sell_price = params['sell_price'].to_i
  @number_in_stock = params['number_in_stock'].to_i
  @number_on_order = params['number_on_order'].to_i
end

def Album.all()
  sql = "SELECT * FROM albums"
  results = SqlRunner.run ( sql )
  results.map {|album| Album.new (album)}
end

def save()
  sql = "INSERT INTO albums (
    title,
    artist,
    genre,
    release_year,
    buy_price,
    sell_price,
    number_in_stock,
    number_on_order
  ) VALUES (
    '#{@title}',
    #{@artist},
    #{@genre},
    #{@release_year},
    #{@buy_price},
    #{@sell_price},
    #{@number_in_stock},
    #{@number_on_order}
  ) RETURNING id"
  @id = SqlRunner.run(sql).first['id'].to_i
end

def Album.delete()
  sql = "DELETE FROM albums"
  SqlRunner.run (sql)
end

end