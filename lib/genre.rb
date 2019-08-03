class Genre
  extend Concerns::Findable
    
  attr_accessor :name, :songs, :song, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
    genre = self.new(name)
    genre.save
    genre
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    @songs << song unless @songs.detect {song}
    song.genre = self unless song.genre != nil
  end
  
  def song_list
    Song.all.select {|song| song.genre == self}
  end
  
  def artists
    song_list.map {|song| song.artist}.uniq
  end
end