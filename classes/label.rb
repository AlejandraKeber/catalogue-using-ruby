require_relative 'item'

class Label
  attr_accessor :title, :color, :items

  def initialize(title, color)
    @id = Time.now.to_i
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
