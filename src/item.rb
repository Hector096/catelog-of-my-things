require 'date'

class Item
  attr_accessor :source, :label, :publish_date
  attr_reader :id

  def initialize(id:, publish_date:, archived: false)
    @id = id
    @id = Random.rand(1..1000) if @id.nil?
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def add_author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_source=(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  def add_label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  private

  def can_be_archived?
    (DateTime.now.year - @publish_date.year) > 10
  end
end
