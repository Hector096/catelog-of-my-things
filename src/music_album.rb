require 'item'

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

  def can_be_archived?
    super && @on_spotify == true
  end

  private :can_be_archived
end
