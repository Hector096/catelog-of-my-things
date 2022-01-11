class Label
  attr_accessor :title, :color, :items
  attr_reader :id

  def initialize(id:, title:, color:, items:)
    @id = id
    @id = Random.rand(1..1000) if @id.nil?
    @title = title
    @color = color
    @items = items || []
  end

  def add_item(item)
    item.label = self
    @items.push(item)
  end
end
