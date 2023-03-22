require './modules/book_module'
require './modules/label_module'

class App
  include BookModule
  include LabelModule
  def add_book
    BookModule.option_add_book
  end

  def display_all_books
    BookModule.list_all_books
  end

  def display_all_labels
    LabelModule.list_all_labels
  end
end
