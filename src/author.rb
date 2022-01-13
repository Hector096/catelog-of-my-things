class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(first_name:, last_name:, id: nil)
    @id = id
    @id = Random.rand(1..1000) if @id.nil?
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.add_author = self
    @items.push(item)
  end

  def to_json(*_args)
    JSON.dump({
                first_name: @first_name,
                last_name: @last_name
              })
  end
end
