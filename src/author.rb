class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(id:nil, first_name:, last_name:)
    @id = id
    @id = Random.rand(1..1000) if @id.nil?
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.add_author self
    @items.push(item)
  end
end
