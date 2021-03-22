require 'pry'
class Song
    #name=
    #sets the song name
    #artist=
    #sets the artist object to belong to the song
    attr_accessor :name, :artist

    #The Song class should have an @@all class variable and 
    #store all Song instances in this variable.
    @@all = []

    #initialize with a name
    #accepts a name for the song and makes it accessible through an attribute accessor
    def initialize(name)
        @name = name
        @@all << self
    end

    #.all
    #returns all existing Song instances
    def self.all
        @@all
    end

    #creates a new instance of a song from the file that's passed
    #associates new song instance with the artist from the filename
    def self.new_by_filename(filename)
        file = filename.split(" - ")
        song = self.new(file[1])
        song.artist_name=(file[0])
        song
    end

    #accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's artist attribute
    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end