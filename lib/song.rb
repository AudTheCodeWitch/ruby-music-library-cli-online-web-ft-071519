class Song
  
  attr_accessor :song 
  attr_reader :artist
  
  @@all = []
  
   def initialize(song, artist=nil)
    @song = song
    @artist = artist
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
end