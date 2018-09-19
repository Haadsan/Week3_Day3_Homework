require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_reader :name, :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

  def save
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING *"
    values =[@name]
    artist = SqlRunner.run(sql, values)
    @id = artist[0]["id"].to_i
  end

  def update()
    sql = "UPDATE artists SET (name) = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end



def self.all
  sql = "SELECT * FROM artists"
  artists = SqlRunner.run(sql)
  return artists.map {|artist_hash| Artist.new(artist_hash)}
end

def self.delete_all
  sql ="DELETE FROM artists"
  SqlRunner.run(sql)
end

def delete()
  sql = "DELETE FROM artists WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def albums()
  sql = "SELECT * FROM albums WHERE artist_id = $1"
  values = [@id]
  albums = SqlRunner.run(sql, values)
  return albums.map{|album_hash| Album.new(album_hash)}
end

def self.find_by_id(id)
  sql = "SELECT * FROM artists WHERE id = $1"
  values = [@id]
  result = SqlRunner.run(sql, values)
  @id = result[0]["id"].to_i  # database object saved/held here
  result_hash = result[0]  # converted here database object to a ruby object
  return Artist.new(result_hash)
end

end
