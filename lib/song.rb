class Song
  attr_accessor :name, :artist_name
  @@all = []

  #def initialize(song)
  #end

  def self.create
    song = self.new
    @@all << song
    return song
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
  @@all.find {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|x| x.name}
  end

  def self.new_from_filename(filename)
    conversion = filename.split(" - ")
    artist_name = conversion[0]
    song_name = conversion[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    conversion = filename.split(" - ")
    artist_name = conversion[0]
    song_name = conversion[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
