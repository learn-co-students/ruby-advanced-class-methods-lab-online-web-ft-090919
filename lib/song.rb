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

  def self.create(name=nil, artist_name=nil)
    #binding.pry
    song = self.new 
    song.name = name 
    song.artist_name = artist_name
    @@all << song 
    song
  end

  def self.new_by_name(name)
    self.create(name)
  end

  def self.create_by_name(name)
    self.create(name)
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name} 
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name) 
      self.create_by_name(name) 
    else
      self.find_by_name(name) 
    end
  end

  def self.alphabetical
    @@all.sort_by{ |song| song.name.downcase }
  end

  def self.new_from_filename(filename)
    artist_name, song_name = filename.split(" - ") 
    @name = song_name.split(".")[0] 
    @artist_name = artist_name
    self.create(@name, @artist_name) 
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end

end