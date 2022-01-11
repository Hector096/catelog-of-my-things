class Item 
    attr_accessor :genre,:author,:source,:label,:publish_date
    attr_reader :id, :archived

    def initialize (id:,genre:,author:,source:,:label:,publish_date:,archived:)
        @id = id
        @id = Random.rand(1..1000) if @id.nil?
        @genre = genre
        @author = author
        @source = source
        @label = label
        @publish_date = publish_date
        @archived = archived
    end

    def move_to_archived
    end

    private 
    def can_be_archived?
    end

end
