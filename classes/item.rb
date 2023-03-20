class Item
    def initialize(genre, author, source, label, publish_date)
        @id = Random.rand(1..1000)
        @genre = genre
        @author = author
        @source = source
        @label = label
        @publish_date = publish_date
        @archived = false
    end

    def move_to_archive(item)
        if can_be_archived?(item)
            item.archived = true
        else
            item.archived = false
        end
    end

    private

    def can_be_archived?(item)
        item.publish_date > 10
    end
end