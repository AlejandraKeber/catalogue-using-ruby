require_relative 'item'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  # rubocop:disable Metrics/ParameterLists
  def initialize(genre, author, label, publish_date, multiplayer, last_played_at)
    # rubocop:enable Metrics/ParameterLists
    super(genre, author, source, label, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && @last_played_at > 2
  end
end
