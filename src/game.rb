require 'item'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

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
    @multiplayer = hash['multiplayer']
    @last_played_at = hash['last_played_at']
  end

  private

  def can_be_archived?; end
end
