require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def Song.create
    song = Song.new
    song.name = @name
    song.artist_name = @artist_name
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
     self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(mp3)
    name_and_title = mp3.chomp(".mp3").split(/ [-] /)
    title = name_and_title[1] 
    artist = name_and_title[0]
    song = self.new
    song.name = title
    song.artist_name = artist
    
    song
  end
  
  def self.create_from_filename(mp3)
    name_and_title = mp3.chomp(".mp3").split(/ [-] /)
    title = name_and_title[1] 
    artist = name_and_title[0]
    song = self.create
    song.name = title
    song.artist_name = artist
    
    @@all << song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
