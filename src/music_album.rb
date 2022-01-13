require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date:, archived:, on_spotify:, id: nil)
    super(
        id: id,
        publish_date: publish_date,
        archived: archived
    )
    @on_spotify = on_spotify
  end

  

  def to_json(*_args)
    JSON.dump({
                spotify: @on_spotify,
                date: @publish_date,
                title: @label.title,
                color: @label.color
              })
  end

  private
  def can_be_archived?
    super && @on_spotify
  end
end
