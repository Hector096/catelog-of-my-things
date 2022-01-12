require 'item'
class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date:, archived:, publisher:, cover_state:, id: nil)
    super(
        id: id,
        publish_date: publish_date,
        archived: archived
    )
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  private :can_be_archived
end
