# require('pg')
require('pry')
require_relative('../models/artist')
require_relative('../models/album')

Artist.delete_all()
Album.delete_all()


artist1 = Artist.new ({
  "name" => "David Bowie"
  })

artist1.save()

album1 = Album.new ({
  "title" => "Spiders from Mars",
  "genre" => "Psych-Rock",
  "artist_id" => artist1.id
  })

  album1.save()


album2 = Album.new ({
  "title" => "Ziggy Stardust",
  "genre" => "Space-Rock",
  "artist_id" => artist1.id
  })

album2.save

album3 = Album.new ({
  "title" => "Space Oddity",
  "genre" => "Space-Rock",
  "artist_id" => artist1.id
  })
album3.save


artist1.albums
album1.artists

# update
album1.title = "Ashes to Ashes"
album1.title

# delete
album3.delete

# find_by_id
album1.id
artist1.id

# All
Artist.all
Album.all

binding.pry
nil
