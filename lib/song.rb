
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
    song.save.first
  end 

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end 

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end 

  def self.find_by_name(name)
    all.detect {|song| song.name==name}
  end 

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)!=nil
      self.find_by_name(name)
    else 
      self.create
    end
  end 
  
  def self.alphabetical
    all.sort_by{|song| song.name}
  end 

  
  # describe '.new_from_filename' do
  #   it 'initializes a song and artist_name based on the filename format' do
  #     song = Song.new_from_filename("Thundercat - For Love I Come.mp3")

  #     expect(song.name).to eq("For Love I Come")
  #     expect(song.artist_name).to eq("Thundercat")
  #   end
  # end


  def self.new_from_filename(file)
 # binding.pry
    artist, song = file.split("-")[0].delete(' '), file.split("-")[1][1..-5]
    new_song = self.create_by_name(song)  
    new_song.artist_name = artist
    new_song

  end 

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end 

  def self.destroy_all
    all.clear
  end 

end
