require_relative 'item'
class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date:, publisher:, cover_state:, archived: false, id: nil)
    super(
        id: id,
        publish_date: publish_date,
        archived: archived
    )
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_json(*_args)
    JSON.dump({
                id:@id,
                title: @label.title,
                color: @label.color,
                publisher:@publisher,
                publish_date: @publish_date,
                cover_state: @cover_state
              })
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
