class Song
  extend Concerns::Findable
  
  attr_accessor :name 
  attr_reader :artist, :genre
  
  @@all = []
  
   def initialize(song, artist=nil, genre=nil)
    @name = song
    self.artist=(artist) if artist
    self.genre=(genre) if genre
    if artist != nil
      artist=(artist)
    end
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
    song = self.new(name)
    song.save
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  
  def self.new_from_filename(filename)
    song = self.find_or_create_by_name(filename.split(" - ")[1])
    song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].chomp('.mp3'))
    song
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
  
#  def self.find_by_name(name)
#    self if @@all.detect{|a| a.song == name}
#  end
#  
#  def self.find_or_create_by_name(name)
#    self.find_by_name(name) ? self : self.create(name)
#  end
  
  
end