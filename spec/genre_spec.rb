require_relative '../classes/genre'
require_relative '../classes/music_album'

describe 'Test genre class' do
  genre = Genre.new('Rock')
  new_item = MusicAlbum.new('2020-02-02', true)
  genre.add_item(new_item)

  it 'takes parameters and returns an genre object' do
    expect(genre).to be_instance_of(Genre)
  end

  it "genre name should be 'Rock'" do
    expect(genre.name).to eql 'Rock'
  end

  it 'The item list should have a length of 1' do
    expect(genre.items.length).to be(1)
  end
end
