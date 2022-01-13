require_relative 'item'
class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date:, archived:false, publisher:, cover_state:, id: nil)
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
                title: @label.title,
                color: @label.color,
                publish_date: @publish_date,
                cover_state: @cover_state
              })
  end

  private 
  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
