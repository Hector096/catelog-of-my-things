class Source
  attr_reader :id, :items
  attr_accessor :name

  def initialize(name:, id: nil)
    @id = id
    @id = Random.rand(1..1000) if @id.nil?
    @name = name
    @items = []
  end

  def add_item(item)
    item.add_source = self
    @items.push(item)
  end
end
