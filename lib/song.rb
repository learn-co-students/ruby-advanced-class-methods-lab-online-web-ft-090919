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
    songs = Song.new
    songs.save
    songs
  end
  
  def self.create_by_name(song_name)
    songs = self.create
    songs.name = song_name
    songs
  end
  
  def self.new_by_name(song_name)
    songs = self.new 
    songs.name = song_name 
    songs
   
  end
  
   def self.find_by_name(song_name)
    self.all.find do |song| 
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
   self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
   def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.destroy_all
    self.all.clear
  end
end
  
end
