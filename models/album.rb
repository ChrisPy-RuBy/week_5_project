require_relative('../db/sql_runner.rb')

class Album

def initialize (params)
  @id = params['id'].to_i
  @title = params['title']
  @artist = params['artist'].to_i
  @genre = params['genre'].to_i
  @release_year = params['release_year']
  @buy_price = params['buy_price']
  @sell_price = params['sell_price']
  @number_in_stock = params['number_in_stock']
  @number_on_order = params['number_on_order']
end



end