require_relative 'music_album'
require_relative 'genre'
require_relative 'create_genre'
require './modules/book_module'
require './modules/label_module'

class App
  include CreateGenre
  include BookModule
  include LabelModule

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

  def list_all_music_albums
    if @music_albums.empty?
      puts 'No music to display. You can add one.'
    else
      @music_albums.each { |music| puts(" | Title: #{music.label.title} Author: #{music.author.first_name} #{music.author.last_name} Genre: #{music.genre.name} | ") }
    end
  end

  def add_music_album
    genre = show_genre(@all_genre)
    @all_genre << genre
    print('Is it on spotify (Y/N): ')
    spotify = gets.chomp
    spotify = spotify != ('n' || 'N')
  end
end