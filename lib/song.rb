

class Song 
  attr_accessor :name, :genre, :artist
 
  def self.new_from_csv(csv_data)
    # Split the CSV data into an array of individual rows.
    rows = csv_data.split("\n")
    # For each row, let's collect a Person instance based on the data
    songs = rows.collect do |row|
      
      data = row.split(", ")
      name = data[0]
      genre = data[1]
      artist = data[2]
 
      # Make a new instance
      Song = self.new # self refers to the Person class. This is song.new
      
      song.name = name
      song.genre = genre
      song.artist = artist
      
      song
    end
   
    songs
  end
    def self.destroy_all
    self.all.clear
  end

end