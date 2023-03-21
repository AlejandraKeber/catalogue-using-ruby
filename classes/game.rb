require_relative 'item'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(genre, author, source, label, publish_date, multiplayer, last_played_at)
    super(genre, author, source, label, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super || @last_played_at > 2
  end
end

game = Game.new('game', 'Alejandra', 'source', 'label', '2019-12-12', 'yes', 1)
puts game.can_be_archived?

game = Game.new('game', 'Alejandra', 'source', 'label', '2019-12-12', 'yes', 5)
puts game.can_be_archived?
