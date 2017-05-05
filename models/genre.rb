require_relative('../db/sql_runner.rb')

class Genre

def initialize(params)
  @id = params['id'].to_i
  @genre_name = params['genre_name']
end

end