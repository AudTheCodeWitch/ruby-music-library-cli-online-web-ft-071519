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
  
  def self.find_by_name(name)
    self if @@all.detect{|a| a.song == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self : self.create(name)
  end
  
  
  
  
  
end