class Item
  def initialize(genre, author, source, label, publish_date)
    @id = Time.now.to_i
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive(item)
    return unless can_be_archived?(item)

    item.archived = true
  end

  private

  def can_be_archived?(item)
    item.publish_date > 10
  end
end
