require 'pry'
class Artist
    attr_accessor :name
    @@artists_names = []

    def initialize(name)
        @name = name
        @@artists_names << name unless @@artists_names.include?(name)
    end

    def songs
        Song.all.select {|song| song.artist = self}
    end

    def add_song(song)
        song.artist = self
    end

    def add_song_by_name(name)
        song = Song.new(name)
        add_song(song)
    end

    def self.song_count
        all_songs = Song.all.select do |song| 
            @@artists_names.each {|name| song.artist.name = name}
        end
        all_songs.count
        # create better method using #songs
    end
end