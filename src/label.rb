class Label
  attr_accessor :title, :color, :items
  attr_reader :id

  def initialize(title:, color:, id: nil)
    @id = id
    @id = Random.rand(1..1000) if @id.nil?
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.add_label = self
    @items.push(item)
  end
end
