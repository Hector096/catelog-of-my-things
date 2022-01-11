class Book
    attr_accessor :on_spotify

    def initialize (id: nil,genre:,author:,source:,:label:,publish_date:,archived:,on_spotify:)
        super(id:id,genre: genre,author: author,source: source,label: label,publish_date:publish_date,archived:archived)
        @on_spotify = on_spotify
    end

    private
    def can_be_archived?
    end

end
