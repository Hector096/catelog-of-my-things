class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id, :archived

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

  private

  def can_be_archived?; end
end
