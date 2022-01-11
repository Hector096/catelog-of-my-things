class Movie
  attr_accessor :silet

  def initialize({
    genre:,
    author:,
    source:,
    label:,
    publish_date:,
    archived:,
    silet:,
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
    @silet = silet
  end

  private

  def can_be_archived?; end
end
