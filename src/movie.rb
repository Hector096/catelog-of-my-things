require_relative 'item'

class Movie < Item
  attr_accessor :silent

  def initialize(publish_date:, silent:, archived: false, id: nil)
    super(
        id: id,
        publish_date: publish_date,
        archived: archived
    )
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end
end
