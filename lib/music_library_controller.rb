class MusicLibraryController
  attr_reader :path
  
  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end
  
  def call
    puts 'Welcome to your music library!'
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts 'What would you like to do?'

    input = gets.strip

    case input
    when 'list songs'
      list_songs
      call
    when 'list artists'
      list_artists
      call
    when 'list genres'
      list_genres
      call
    when 'list artist'
      list_songs_by_artist
      call
    when 'list genre'
      list_songs_by_genre
      call
    when 'play song'
      play_song
      call
    when 'exit'
    else 'What would you like to do?'
      call
    end
  end

  def list_songs
    sorted_songs = Song.all.sort{ |song_a, song_b| song_a.name <=> song_b.name }
    sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted_artists = Artist.all.sort{ |artist_a, artist_b| artist_a.name <=> artist_b.name }
    sorted_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    sorted_genres = Genre.all.sort{ |genre_a, genre_b| genre_a.name <=> genre_b.name }
    sorted_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts 'Please enter the name of an artist:'
    input = gets.strip

    if artist = Artist.find_by_name(input)
      sorted_songs = artist.songs.sort{ |song_a, song_b| song_a.name <=> song_b.name }
      sorted_songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts 'Please enter the name of a genre:'
    input = gets.strip

    if genre = Genre.find_by_name(input)
      sorted_songs = genre.songs.sort{ |song_a, song_b| song_a.name <=> song_b.name }
      sorted_songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts 'Which song number would you like to play?'
    input = gets.strip.to_i
    index = input - 1
    sorted_songs = Song.all.sort{ |song_a, song_b| song_a.name <=> song_b.name }
    if index >= 0 && index < sorted_songs.length
    puts "Playing #{sorted_songs[index].name} by #{sorted_songs[index].artist.name}"
    end
  end
end