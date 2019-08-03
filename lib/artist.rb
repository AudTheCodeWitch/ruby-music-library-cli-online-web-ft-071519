# require_relative 'concerns/music.rb'

class Artist
  extend Concerns::Findable
#  extend Music::ClassMethods
#  include Music::InstanceMethods
  
  attr_accessor :name, :songs 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
    artist = self.new(name)
    artist.save
    artist
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
    binding.pry
  end
end