require './modules/book_module'
require './modules/label_module'
require './modules/game_module'
require './modules/author_module'

class App
  include BookModule
  include LabelModule
  include GameModule
  include AuthorModule

  def add_book
    BookModule.option_add_book
  end

  def display_all_books
    BookModule.list_all_books
  end

  def display_all_labels
    LabelModule.list_all_labels
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
end
