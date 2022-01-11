class Book
  attr_accessor :publisher, :cover_state

  def initialize({
    genre:,
    author:,
    source:,
    label:,
    publish_date:,
    archived:,
    publisher:,
    cover_state:,
    id: nil
})
    super(
        id: id,
        genre: genre,
        author: author,
        source: source,
        label: label,
        publish_date: publish_date,
        archived: archived
    )
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?; end
end
