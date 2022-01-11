require 'item'
class Book < Item
  attr_accessor :publisher, :cover_state

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
    @publisher = hash['publisher']
    @cover_state = hash['cover_state']
  end

  private

  def can_be_archived?
    
  end
end
