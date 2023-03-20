class Main
  def menu
    puts "\n-----------------------------------\nPick an option by entering a number:"
    print("
    1  - List all books
    2  - List all music albums
    3  - List all games
    4  - List all genres
    5  - List all labels
    6  - List all authors
    7  - Add a book
    8  - Add a music album
    9  - Add a movie
    10 - Add a game
    0  - Exit
    ")
  end

  def main
    option = -1
    app = App.new # not implemented
    until option.zero?
      menu
      option = gets.chomp.to_i
      puts ''
      run_menu(app, option) unless option.zero? # not implemented
    end
    puts 'Thank you for using this app'
  end
end

Main.new.main
