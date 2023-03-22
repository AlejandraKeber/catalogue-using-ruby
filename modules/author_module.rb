require './classes/author'

module AuthorModule
  module_function

  @list_of_authors = []

  def add_author_ui
    puts "*- Authors -*"
    list_all_authors
    print "\nSelect an author [number on the list] or create a new author [0]: "
    author = gets.chomp
    select_create_author(author)
  end

  def list_all_authors
    puts 'Authors list is empty, please create a new one' if @list_of_authors.empty?
    @list_of_authors.each_with_index do |author, index|
      puts "#{index + 1} - First name: #{author.first_name} Last name: #{author.last_name}"
    end
  end

  def create_author
    puts "\n*- New Author -*"
    print 'First name: '
    first_name = gets.chomp
    print 'Last name: '
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end

  def filter_author(index)
    list_all_author.each_with_index do |author, i|
      return author if i == index
    end
  end

  def select_create_author(index)
  index = index.to_i
  return 'Invalid number' unless index <= @list_of_authors.length && index >= 0

    if index.zero?
      new_author = create_author
      @list_of_authors << new_author unless @list_of_authors.include?(new_author)
      new_author
    else
      filter_author(index - 1)
    end
  end
end