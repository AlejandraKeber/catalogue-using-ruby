require 'date'
require_relative 'genre'

class Item
  attr_accessor :label, :author, :genre
  attr_reader :id, :publish_date, :archived

  def initialize(publish_date)
    @id = Time.now.to_i
    @genre = genre
    genre.items << self
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  def move_to_archive
    return unless can_be_archived?
    @archived = true
  end

  def add_label(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  private

  def can_be_archived?
    today = Date.today
    # 12 months in a year * 10 years = 120 months
    ten_years_ago = today << 120
    @publish_date < ten_years_ago
  end
end
