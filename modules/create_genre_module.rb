require_relative 'genre'

module CreateGenre
  module_function

  @all_genre = load_genre

  def show_genre(list_of_genre = @all_genre)
    puts('Select genre from the list:')
    list_all_genre(list_of_genre)
    puts("#{list_of_genre.length + 1}. Create a new genre")
    option = gets.chomp
    genre = select_genre(list_of_genre, option.to_i)
    all_genre.push(genre) unless all_genre.include?(genre)
    genre
  end

  def list_all_genre(list_of_genre = @all_genre)
    if list_of_genre.empty?
      puts 'No genre to display. You can add one.'
    else
      list_of_genre.each_with_index { |genre, i| puts(" | #{i}. Genre: #{genre.name} | ") }
    end
  end

  def select_genre(list_of_genre, index)
    if index < list_of_genre.length
      list_of_genre[index]
    else
      print('Enter the name of the genre: ')
      name = gets.chomp
      genre = new_genre(name)
      genre
    end
  end

  def new_genre(name)
    genre = Genre.new(name)
    genre
  end

  def return_genre(name)
    @all_genre.each do |genre|
      if genre.name == name
        genre
      end
    end
  end

  def save_genre
    genre_list = []
    @all_genre.each do |genre|
      genre_obj = {
        name: genre.name,
        items: genre.items
      }
      genre_list << genre_obj
    end
    File.write('./memory/genre.json', JSON.pretty_generate(genre_list))
  end

  def load_genre
    genre_list = []
    if JSON.parse(File.read('./memory/genre.json')).any?
      genre_list = JSON.parse(File.read('./memory/genre.json')).map do |genre|
        Genre.new(genre['name']).add_item_list(genre['items'])
      end
    end
    genre_list
  end
end
