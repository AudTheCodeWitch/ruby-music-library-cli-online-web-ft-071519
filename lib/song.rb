class Song
  
  attr_accessor :song 
  attr_reader :artist, :genre
  
  @@all = []
  
   def initialize(song, artist=nil, genre=nil)
    @song = song
    self.artist=(artist) if artist
    self.genre=(genre) if genre
    save
    self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    self.new(name)
    self
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
end