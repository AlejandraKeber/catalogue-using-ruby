require_relative 'music_album'
require_relative 'genre'

class App
  def initialize
    @music_albums = []
    @all_genre = []
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts 'No music to display. You can add one.'
    else
      @music_albums.each { |music| puts(" | Title: #{music.label.title} Author: #{music.author.first_name} #{music.author.last_name} Genre: #{music.genre.name} | ") }
    end
  end

  def list_all_genre
    if @all_genre.empty?
      puts 'No genre to display. You can add one.'
    else
      @all_genre.each { |genre| puts(" | Title: Genre: #{genre.name} | ") }
    end
  end

  def add_music_album
    
  end
end