class Genre
  extend Concerns::Findable

  attr_accessor :name, :song, :songs

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
    genre = new(name)
    genre.save
    genre
  end

  # def songs
   # @songs
  # end

  def add_song(song)
    @songs << song unless @songs.detect { song }
    song.genre = self unless song.genre != nil
  end

  def song_list
    Song.all.select { |song| song.genre == self }
  end

  def artists

  end
end