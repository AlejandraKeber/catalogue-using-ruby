class Genre
  attr_accessor :items, :name

  def initialize(name)
    @id = Time.now.to_i
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end

  def add_item_list(item_list)
    @items = item_list
  end
end
