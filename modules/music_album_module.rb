require_relative 'create_genre_module'
require_relative 'label_module'
require './classes/music_album'

module MusicAlbumModule
  include CreateGenre
  include LabelModule

  def music_main(all_albums, all_genre)
    label = LabelModule.add_label_ui
    genre = CreateGenre.show_genre(all_genre)
    all_genre.push(genre) unless all_genre.include?(genre)
    print('Enter publish date (YYYY-MM-DD): ')
    publish_date = gets.chomp
    print('Is it on spotify (Y/N)?')
    on_spotify = gets.chomp
    on_spotify = on_spotify != ('n' || 'N')

    new_album = MusicAlbum.new(genre, author, label, publish_date, on_spotify)
    all_albums << new_album
    all_genre << genre
    return all_albums, all_genre
  end
end