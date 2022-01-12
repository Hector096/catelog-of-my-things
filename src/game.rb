require 'item'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date:, archived:, multiplayer:, last_played_at:, id: nil)
    super(
        id: id,
        publish_date: publish_date,
        archived: archived
    )
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Time.now.year - @last_played_at.year) > 2
  end
end
