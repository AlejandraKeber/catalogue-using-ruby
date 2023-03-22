require './classes/book'
require_relative 'label_module'
require_relative 'date_module'

module BookModule
  module_function

  include LabelModule
  include DateModule

  @list_of_books = []

  def option_add_book
    puts "\n*- Add a book -*\n"
    print 'Cover state: '
    cover_state = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp
    book = Book.new(DateModule.correct_date_format, publisher, cover_state)
    label = LabelModule.add_label_ui
    book.add_label(label)
    @list_of_books << book
    puts 'Book successfully created!'
  end

  def list_all_books
    puts "\n*- Books list -*"
    puts 'Books list is empty' if @list_of_books.empty?
    @list_of_books.each_with_index do |book, index|
      puts "[#{index}] - Cover state: #{book.cover_state} Publisher: #{book.publisher}"
      puts "Publish date: #{book.publish_date} Label: #{book.label.title}\n"
    end
  end
end
