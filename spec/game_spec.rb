require_relative '../classes/game'

describe 'Test Game class' do
  game = Game.new('2010-10-10', 'Y', '2020-10-10')

  it 'takes parameters and returns an game object' do
    expect(game).to be_instance_of(Game)
  end

  it "game publish date should be '2010-10-10'" do
    expect(game.publish_date).to eq Date.new(2010, 10, 10)
  end

  it "game last played date should be '2020-10-10'" do
    expect(game.last_played_at).to eq '2020-10-10'
  end
end
