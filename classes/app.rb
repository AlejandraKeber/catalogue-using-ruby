require_relative 'music_album'
require_relative 'genre'
require './modules/create_genre_module'
require './modules/book_module'
require './modules/label_module'
require './modules/game_module'
require './modules/author_module'
require './modules/music_album_module'

class App
  include CreateGenre
  include BookModule
  include LabelModule
  include GameModule
  include AuthorModule
  include MusicAlbumModule

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
    MusicAlbumModule.list_all_albums
  end

  def display_all_genre
    CreateGenre.list_all_genre
  end

  def add_music_album
    MusicAlbumModule.music_main
  end

  def add_game
    GameModule.option_add_game
  end

  def display_all_games
    GameModule.list_all_games
  end

  def display_all_authors
    AuthorModule.list_all_authors
  end

  def save_data
    BookModule.save_books
    LabelModule.save_labels
    CreateGenre.save_genre
    MusicAlbumModule.save_music_album
    GameModule.save_games
    AuthorModule.save_authors
  end

  def load_data
    BookModule.load_books
    GameModule.load_games
    LabelModule.load_labels(BookModule.all_books, GameModule.all_games)
    AuthorModule.load_authors(GameModule.all_games, BookModule.all_books)
    # CreateGenre.load_genre
  end
end
