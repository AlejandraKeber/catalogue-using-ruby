require_relative 'create_genre_module'
require_relative 'label_module'
require './classes/music_album'
require_relative 'author_module'

module MusicAlbumModule
  module_function

  include CreateGenre
  include LabelModule
  incluce AuthorModule

  @music_albums = []

  def music_main
    label = LabelModule.add_label_ui
    genre = CreateGenre.show_genre
    author = AuthorModule.add_author_ui
    print('Enter publish date (YYYY-MM-DD): ')
    publish_date = gets.chomp
    print('Is it on spotify (Y/N)?')
    on_spotify = gets.chomp
    on_spotify = on_spotify != ('n' || 'N')
    new_album = MusicAlbum.new(publish_date, on_spotify)
    new_album.add_label(label)
    new_album.add_author(author)
    new_album.add_genre(genre)
    @music_album.push(new_album)
    puts 'New Music Album created!'
  end

  def list_all_albums
    if @music_albums.empty?
      puts 'No music to display. You can add one.'
    else
      @music_albums.each { |music| puts(" | Title: #{music.label.title} Author: #{music.author.first_name} #{music.author.last_name} Genre: #{music.genre.name} | ") }
    end
  end

  def save_music_album
    album_list = []
    @music_album.each do |album|
      album_obj = {
        genre: album.genre.name,
        author_first_name: album.author.first_name,
        author_last_name: album.author.last_name,
        label_title: album.label.title,
        label_color: album.label.color,
        publish_date: album.publish_date,
        on_spotify: album.on_spotify
      }
      album_list << album_obj
    end
    File.write('./memory/music_album.json', JSON.pretty_generate(album_list))
  end

  def load_music_album
    album_list = []
    if JSON.parse(File.read('./memory/music_album.json')).any?
      album_list = JSON.parse(File.read('./memory/music_album.json')).map do |album|
        genre = CreateGenre.return_genre(album['genre'])
      end
    end
  end
end