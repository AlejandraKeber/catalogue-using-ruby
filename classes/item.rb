require 'date'

class Item
    attr_accessor :label
  attr_reader :id, :genre, :author,
              :source, :publish_date, :archived

  def initialize(genre, author, source, label, publish_date)
    @id = Time.now.to_i
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  private

  def can_be_archived?
    today = Date.today
    # 12 months in a year * 10 years = 120 months
    ten_years_ago = today << 120
    @publish_date < ten_years_ago
  end
end
