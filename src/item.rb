class Item
  attr_accessor :source, :label, :publish_date
  attr_reader :id, :archived, :author, :genre

  def initialize(hash = {})
    @id = hash['id']
    @id = Random.rand(1..1000) if @id.nil?
    @genre = hash['genre']
    @author = hash['author']
    @source = hash['source']
    @label = hash['label']
    @publish_date = hash['publish_date']
    @archived = hash['archived']
  end

  def move_to_archived; end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  private

  def can_be_archived?; end
end
