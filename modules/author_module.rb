require './classes/author'

module AuthorModule
  module_function

  @list_of_authors = []
  @file = './data/authors_collection.json'

  def add_author_ui
    puts '*- Authors -*'
    list_all_authors
    print "\nSelect an author [number on the list] or create a new author [0]: "
    author = gets.chomp
    select_create_author(author)
  end

  def list_all_authors
    puts '*- Authors -*'
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
    @list_all_author.each_with_index do |author, i|
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

  def filter_items(author, ids, all_games)
    items = []
    ids.each do |id|
      game = all_games.find { |game_element| game_element.id == id }
      if game
        items << game
        game.author = author
      end
      # label
      # genre
    end
    items
  end

  def load_authors(all_games)
    return unless File.exist?(@file) && !File.empty?(@file)

    JSON.parse(File.read(@file)).each do |author|
      new_author = Author.new(author['first_name'], author['last_name'])
      new_author.id = author['id']
      new_author.items = filter_items(new_author, author['items'], all_games)
      @list_of_authors << new_author
    end
  end

  def save_authors
    File.new(@file, 'w') unless File.exist?(@file)
    data = []

    @list_of_authors.each do |author|
      items_ids = []
      author.items.each do |item|
        items_ids << item.id
      end
      data.push({ id: author.id, first_name: author.first_name, last_name: author.last_name,
                  items: items_ids })
    end
    File.write(@file, JSON.generate(data))
  end
end
