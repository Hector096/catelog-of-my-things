require 'item'

class Movie < Item
  attr_accessor :silet

  def initialize(publish_date:, archived:, silet:, id: nil)
    super(
        id: id,
        publish_date: publish_date,
        archived: archived
    )
    @silet = silet
  end

  def can_be_archived?; end

  private :can_be_archived
end
