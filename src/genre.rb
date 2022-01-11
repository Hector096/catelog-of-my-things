class Genre
  attr_reader :id, :items
  attr_accessor :name

  def initialize(id:, name:, items:)
    @id = id
    @id = Random.rand(1..1000) if @id.nil?
    @name = name
    @items = items
  end

  def add_item(item); end
end
