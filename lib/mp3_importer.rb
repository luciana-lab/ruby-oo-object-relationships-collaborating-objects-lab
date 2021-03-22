require 'pry'
class MP3Importer
    attr_accessor :path
    
    #accepts a file path to parse mp3 files from
    def initialize(path)
        @path = path
    end

    #loads all the mp3 files in the path directory
    #normalizes the filename to just the mp3 filename with no path
    #source https://stackoverflow.com/questions/1755665/get-names-of-all-files-from-a-folder-with-ruby
    def files
        #binding.pry
        Dir.entries(path).select {|mp3| File.file? File.join(path, mp3)}
    end

    #imports the files into the library by creating songs from a filename
    def import
        #binding.pry
        files.each {|filename| Song.new_by_filename(filename)}

    end
end