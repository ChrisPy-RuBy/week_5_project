require_relative('../db/sql_runner.rb')

class Album

  attr_reader :id, :title, :artist, :genre, :release_year, :album_artwork

  attr_accessor :buy_price, :sell_price, :number_in_stock, :number_on_order

  def initialize (params)
    @id = params['id'].to_i
    @title = params['title']
    @artist = params['artist'].to_i #Craig recommends updating these. values to artist_id for claritiy
    @genre = params['genre'].to_i #please remember that this is actually the id here not the name.
    @release_year = params['release_year']
    @buy_price = params['buy_price'].to_i
    @sell_price = params['sell_price'].to_i
    @number_in_stock = params['number_in_stock'].to_i
    @number_on_order = params['number_on_order'].to_i
    @album_artwork = params['album_artwork']
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
    number_on_order,
    album_artwork
    ) VALUES (
    '#{@title}',
    #{@artist},
    #{@genre},
    #{@release_year},
    #{@buy_price},
    #{@sell_price},
    #{@number_in_stock},
    #{@number_on_order},
    '#{@album_artwork}'
    ) RETURNING id"
    @id = SqlRunner.run(sql).first['id'].to_i
  end

  def genre()
    sql = "SELECT * FROM genres g WHERE g.id = #{@genre}"
    genre = SqlRunner.run ( sql )
    return Genre.new (genre.first)
  end

  def artist()
    # sql = "SELECT a.artist_name, b.title FROM artists a INNER JOIN albums b ON b.artist = a.id"
    sql = "SELECT * FROM artists a WHERE a.id = #{@artist}
    "
    artist = SqlRunner.run ( sql )
    return Artist.new(artist.first) 
  end

# def artist_and_genre()
#   sql = "SELECT a.artist_name, b.title, g.genre_name  FROM artists a INNER JOIN albums b ON b.artist = a.id INNER JOIN genres g  ON b.genre = g.id"
#   results = SqlRunner.run (sql).first[]
#   return results
# end        

# how do you output both if you want both at the same time?


def update
  sql = "UPDATE ablums SET
      title = '#{@title}',
      artist = #{@artist},
      genre = #{@genre},
      release_year = '#{@release_year}',
      buy_price = #{@buy_price},
      sell_price = #{@sell_price},
      number_in_stock = #{@number_in_stock}
      number_on_order = #{@number_on_order}
      album_artwork = '#{album_artwork}' "
      SqlRunner.run( sql )
end

def update_ordering() 
  sql = "UPDATE albums SET
  number_in_stock = #{@number_in_stock},
  number_on_order = #{@number_on_order}
  WHERE id = #{ @id } "
  SqlRunner.run( sql )
end

def update_pricing() 
  sql = "UPDATE albums SET 
    buy_price = #{@buy_price},
    sell_price = #{@sell_price} 
    WHERE id = #{@id} "
  SqlRunner.run( sql )
end


def Album.find(id)
  sql = "SELECT * FROM albums WHERE id=#{id}"
  results = SqlRunner.run( sql )
  return Album.new( results.first )
end

def Album.destroy(id)
  sql = "DELETE FROM albums WHERE id = #{id}"
  SqlRunner.run( sql )
end

def Album.delete_all()
  sql = "DELETE FROM albums"
  SqlRunner.run(sql)
end
end
