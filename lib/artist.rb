# require_relative 'concerns/music.rb'

class Artist
  extend Concerns::Findable
#  extend Music::ClassMethods
#  include Music::InstanceMethods
  
  attr_accessor :artist, :songs
  
  @@all = []
  
  def initialize(artist)
    @artist = artist
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
    self.new(name)
    self
  end
  
  def add_song(song)
    @songs << song unless @songs.detect {song}
    song.artist = self unless song.artist != nil
  end
  
  def song_list
    Song.all.select {|song| song.artist == self}
  end
  
  def genres
    song_list.map {|song| song.genre}.uniq
  end
end