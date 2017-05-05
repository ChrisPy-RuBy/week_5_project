require_relative('../db/sql_runner.rb')

class Artist

def initialize (params)
  @id = params['id'].to_i
  @artist_name = params['artist_name']
end

end