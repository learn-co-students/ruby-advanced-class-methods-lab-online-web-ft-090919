require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    obj = self.new
    obj.save
    obj
  end

  def self.new_by_name (arg)
    obj = self.new
    obj.name = arg
    obj
  end

  def self.create_by_name (arg)
    obj = self.new
    obj.name = arg
    obj.save
    obj
  end

  def self.find_by_name (arg)
    self.all.find {|obj| obj.name == arg}
  end

  def self.find_or_create_by_name (arg)
    if self.find_by_name (arg)
       self.find_by_name (arg)
     else
       self.create_by_name (arg)
     end
  end

  def self.alphabetical
    self.all.sort_by {|obj| obj.name}
  end

  def self.new_from_filename (arg)
    obj = self.new
    artis_name = arg.match(/\b[^"-]*/).to_s[0..-2]
    song_name = arg.match(/- [a-zA-Z\s]+/).to_s[2..-1]
    #binding.pry
    obj.artist_name = artis_name
    obj.name = song_name
    obj
  end

  def self.create_from_filename (arg)
    obj = self.new
    artis_name = arg.match(/\b[^"-]*/).to_s[0..-2]
    song_name = arg.match(/- [a-zA-Z\s]+/).to_s[2..-1]
    #binding.pry
    obj.artist_name = artis_name
    obj.name = song_name
    obj.save
    obj
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end


end
#
