require 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(hash = {})
    super(
        id: hash['id'],
        genre: hash['genre'],
        author: hash['author'],
        source: hash['source'],
        label: hash['label'],
        publish_date: hash['publish_date'],
        archived: hash['archived']
    )
    @on_spotify = hash['on_spotify']
  end

  private

  def can_be_archived?; end
end
