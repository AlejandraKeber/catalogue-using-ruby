require './classes/game'
require_relative 'author_module'

module GameModule
  module_function

  include AuthorModule

  @list_of_games = []

  def option_add_game
    puts '\n*- Add a game -*\n'
    print 'Is it a multiplayer game? [Y/N]: '
    multiplayer = gets.chomp.to_s.downcase == 'y'
    print 'When was it last played at? '
    last_played_at = gets.chomp
    print 'Published Date: '
    publish_date = gets.chomp
    game = Game.new(publish_date, multiplayer, last_played_at)
    author = AuthorModule.add_author_ui
    game.add_author(author)
    @list_of_games << game
    puts 'Game successfully created!'
  end

  def list_all_games
    puts 'Game list is empty' if @list_of_games.empty?
    @list_of_games.each_with_index do |game, index|
      puts "[#{index}] - Publish date: #{game.publish_date} Last played: #{game.last_played_at}
    Multiplayer: #{game.multiplayer}\n"
    end
  end
end
