class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(id:, first_name:, last_name:, items:)
    @id = id
    @id = Random.rand(1..1000) if @id.nil?
    @first_name = first_name
    @last_name = last_name
    @items = items || []
  end

  def add_item(item)
    item.author = self
    @items.push(item)
  end
end
