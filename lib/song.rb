class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name, artist_name)
    @name = name
    @artist_name = artist_name
    self.class.all << self
  end

  def self.create(song)
    song = self.new
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end



end
