require_relative '../classes/music_album'

describe 'Test Music Album class' do
  album = MusicAlbum.new('2023-12-10', 'Y')

  it 'takes parameters and returns an album object' do
    expect(album).to be_instance_of(MusicAlbum)
  end

  it "game publish date should be '2023-12-10'" do
    expect(album.publish_date).to eq Date.new(2023, 12, 10)
  end
end
