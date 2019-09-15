class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.new_by_name(name)
    new_song = new
    new_song.name = name
    new_song
  end

  def self.new_from_filename(filename)
    filename = filename.split("-")
    artist_name = filename[0].strip
    song_name = filename[1].split(".")[0].strip
    song = new_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
  end
  
  def self.create
    new_song = new
    new_song.save
    new_song
  end

  def self.create_by_name(name)
    new_song = new_by_name(name)
    new_song.save
    new_song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end

  def self.find_by_name(name)
    all.find { |song| song.name == name }
  end

  def self.alphabetical
    all.sort { |a, b| a.name <=> b.name }
  end

  def save
    self.class.all << self
  end


end
