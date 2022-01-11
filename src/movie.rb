require 'item'

class Movie < Item
  attr_accessor :silet

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
    @silet = hash['silet']
  end

  private

  def can_be_archived?; end
end
