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

  def self.create
    song = self.new
    @@all << song
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end

  def self.find_by_name(name)
    @@all.detect do |sname|
      sname.name == name
    end
  end

  def self.find_or_create_by_name(name)
     self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by { |sname| sname.name }
  end

  def self.new_from_filename(sname)

    song = self.new
    sname = sname[0...-4]
    array = sname.split(" - ")
    song.artist_name = array[0]
    song.name = array[1]
    song
  end

  def self.create_from_filename(sname)
      song = self.new
      song.name = (sname.split(" - ")[1].chomp(".mp3"))
      song.artist_name = (sname.split(" - ")[0])
      @@all << song
      song
    end

  def self.destroy_all
    @@all.clear
  end





end
