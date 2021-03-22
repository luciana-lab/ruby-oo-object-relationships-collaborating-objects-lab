require 'pry'
#require_relative './song.rb'
class Artist
    #name=
    #sets the artist name
    attr_accessor :name

    #@@all class variable and store all Artist instances in this variable
    @@all = []

    #initialize with #name
    #accepts a name for the artist
    def initialize(name)
        @name = name
        @@all << self
    end

    #returns all existing Artist instances
    def self.all
        @@all
    end

    #This instance method returns an Array of all songs that belong to this Artist instance.
    #This method should get all existing Song instances from Song and select only the ones that are associated with this Artist instance.
    #lists all songs that belong to this artist
    def songs
        Song.all.select {|song| song.artist == self}
    end

    #keeps track of an artist's songs
    def add_song(song)
        song.artist = self
    end

    #finds or creates an artist by name maintaining uniqueness of objects by name property
    #always returns an Artist instance
    #Creates new instance of Artist if none exist
    def self.find_or_create_by_name(artist_name)
        if @@all.detect {|artist| artist.name == artist_name}
            @@all.detect {|artist| artist.name == artist_name}
        else
            self.new(artist_name)
        end
    end

    #lists all of the artist's songs
    def print_songs
        songs.each do |song| 
            puts song.name
        end
    end

end
