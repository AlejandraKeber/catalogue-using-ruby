require_relative 'music_album'
require_relative 'genre'
require './modules/create_genre_module'
require './modules/book_module'
require './modules/label_module'
require './modules/music_album_module'

class App
  include CreateGenre
  include BookModule
  include LabelModule
  include MusicAlbumModule

  def initialize
    @music_albums = []
    @all_genre = []
  end

  def add_book
    BookModule.option_add_book
  end

  def display_all_books
    BookModule.list_all_books
  end

  def display_all_labels
    LabelModule.list_all_labels
  end

  def display_all_music_albums
    if @music_albums.empty?
      puts 'No music to display. You can add one.'
    else
      @music_albums.each { |music| puts(" | Title: #{music.label.title} Author: #{music.author.first_name} #{music.author.last_name} Genre: #{music.genre.name} | ") }
    end
  end

  def display_all_genre
    CreateGenre.list_all_genre(@all_genre)
  end

  def add_music_album
    albums, genre = music_main(@music_albums, @all_genre)
  end
end