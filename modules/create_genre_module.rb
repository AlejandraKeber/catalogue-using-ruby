require_relative 'genre'

module CreateGenre
  module_function

  def show_genre(list_of_genre)
    puts('Select genre from the list:')
    list_all_genre(list_of_genre)
    puts("#{list_of_genre.length + 1}. Create a new genre")
    option = gets.chomp
    genre = select_genre(list_of_genre, option.to_i)
    genre
  end

  def list_all_genre(list_of_genre)
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
end
