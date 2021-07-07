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
    nsong = self.new
    @@all << nsong
    nsong
  end
  
  def self.new_by_name(sname)
    nsong = self.new
    nsong.name = sname
    nsong
  end
  def self.create_by_name(sname)
    nsong = self.new
    nsong.name = sname
    @@all << nsong
    nsong
  end
  
  def self.find_by_name(sname)
    self.all.detect { |song| song.name == sname}
  end
  
    def self.find_or_create_by_name(sname)
    self.find_by_name(sname) || self.create_by_name(sname)
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(fname)
    data = fname.split(" - ")
    song_and_format = data[1].split(".")
    song = self.new
    song.name = song_and_format[0]
    song.artist_name = data[0]
    song
  end
  
  def self.create_from_filename(fname)
    data = fname.split(" - ")
    song_and_format = data[1].split(".")
    song = self.create
    song.name = song_and_format[0]
    song.artist_name = data[0]
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
end
