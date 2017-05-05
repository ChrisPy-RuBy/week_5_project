require ('pg')

class SqlRunner 

  def SqlRunner ( sql )
    begin
      db = PG.connect({dbname:'matts_shop', host:'localhost'})
      result = db.exec( sql )
    ensure
      db.close
    end
    return result
  end
end



