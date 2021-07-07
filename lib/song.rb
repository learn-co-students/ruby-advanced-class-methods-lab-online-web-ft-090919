require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end
  
  def self.find_by_name(song_name) 
    @@all.detect do |ele|
      ele.name == song_name 
    end
  end
  
  def self.find_or_create_by_name(song_name)
    x = self.find_by_name(song_name)
  
    if x
      x 
    else
      self.create_by_name(song_name )
    end
  end
  
  def self.alphabetical
    @@all.sort_by {|ele| ele.name}
  end
  
  def self.new_from_filename(name_with_mp3)
     file_name = self.new
     new = name_with_mp3.split("-")
     name_artist = new.map do |ele| 
      ele.gsub(".mp3", "").strip
     end
     file_name.name = name_artist[1]
     file_name.artist_name = name_artist[0]
     file_name
  end
  
  def self.create_from_filename(name_with_mp3)
     file_name = self.new
     new = name_with_mp3.split("-")
     name_artist = new.map do |ele| 
      ele.gsub(".mp3", "").strip
     end
     file_name.name = name_artist[1]
     file_name.artist_name = name_artist[0]
     file_name.save
     file_name
  end

  def self.destroy_all
    self.all.clear
  end
end

