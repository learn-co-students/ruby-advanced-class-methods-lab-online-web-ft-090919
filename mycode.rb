require 'pry'

class Song
  attr_accessor :name, :artist_name, :extra 
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
 
  def self.create
    new_song = self.new 
    @@all << new_song
    new_song
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
    self.all.find do |song| song.name == name end 
  end 

  def self.find_or_create_by_name(name)
  # if self.find_by_name(name) == nil 
  #    self.create_by_name(name)
  #  else 
  #    self.find_by_name(name)
  #  end
    self.find_by_name(name) || self.create_by_name(name)
  end 
  
  def self.alphabetical
   @@all.sort_by { |song| song.name }
  end 

  def self.new_from_filename(filename)
    
    row = filename.split(" - ")
    row.collect! do |x| x.gsub(/.mp3\z/, "") end
    
      artist_name = row[0]
      name = row[1]

      file = self.new 
      file.name = name
      file.artist_name = artist_name
      
      file
  end
    
    
end