require 'pry'
class MusicImporter
  attr_reader :path
  
  def initialize(path)
    @path = path
    # binding.pry
  end
  
  def files
    Dir::entries(path).select { |file|  file.include?("mp3") }
  end
  
  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
  
end