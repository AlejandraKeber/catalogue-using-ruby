require_relative 'item'

class Book < Item
    attr_accessor :publisher, :cover_state
  # rubocop:disable Metrics/ParameterLists
  def initialize(genre, author, source, label, publish_date, publisher, cover_state)
    # rubocop:enable Metrics/ParameterLists
    super(genre, author, source, label, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
