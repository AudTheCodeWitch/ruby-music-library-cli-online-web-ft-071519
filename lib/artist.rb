# require_relative 'concerns/music.rb'

class Artist
#  extend Music::ClassMethods
#  include Music::InstanceMethods
  
  attr_accessor :artist, :songs, :song
  
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
end