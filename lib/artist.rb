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
    artist = new(name)
    artist.save
    artist
  end

  def add_song(song)
    @songs << song unless @songs.detect { song }
    song.artist = self unless song.artist
  end

  def genres
    @songs.map { |song| song.genre }.uniq
    binding.pry
  end
end