require 'pry'

class Song
  attr_accessor :name, :artist_name
  attr_writer :name
  
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    track = self.new
    self.all << track 
    track
  end
  
  def self.new_by_name(name)   #Song.new_by_name("Blank Space")
    track = self.new 
      track.name = name 
    track
  end

  def self.create_by_name(name)
    track = self.create
      track.name = name
    track
  end
  def self.find_by_name(name)
   self.all.detect {|i| name == i.name  ? i.name : false }
  end 
  def self.find_or_create_by_name(name)
    track = self.find_by_name(name) 
    #binding.pry
    if track != nil
      return track
    else
      self.create_by_name(name)
    end    
  end
  def self.alphabetical
    @@all.sort_by {|i| i.name}
  end
  def self.new_from_filename(name)
    track = name.split(" - ")
    new_song = self.new
    new_song.name = track[1].split(".")[0]
    new_song.artist_name = track[0]
    new_song   
  end
  def self.create_from_filename(name)
    #binding.pry
    track = name.split(" - ")
    new_song= self.create
    new_song.name = track[1].split(".")[0]
    new_song.artist_name = track[0]
    new_song
  end
  def self.destroy_all
    @@all.clear
  end
end 