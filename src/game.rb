class Game
    def initialize(id: nil,genre:,author:,source:,:label:,publish_date:,archived:,multiplayer:,last_played_at:)
        super(id: id,genre: genre,author: author,source: source,label: label,publish_date:publish_date,archived:archived)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end

    private

    def can_be_archived?
    end
end
