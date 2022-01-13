require 'json'
require_relative '../author'
require_relative '../genre'
require_relative '../label'
require_relative '../source'

module MainMethods
  def add_author(item)
    puts "\n Enter the authors full name:\n"
    print '  First name: '
    first_name = gets.chomp

    print '  Last name: '
    last_name = gets.chomp

    author_name = Author.new(first_name: first_name, last_name: last_name)
    author_name.add_item(item)
    @authors.push(author_name)
  end

  def add_genre(item)
    puts "\n Enter the genre of this item:\n"
    print '  Genre: '
    genre_name = gets.chomp

    genre = Genre.new(name: genre_name)
    genre.add_item(item)
    @genres.push(genre)
  end

  def add_label(item)
    puts "\n Enter the label details of the item:\n"
    print '  Title: '
    title = gets.chomp

    print '  Color: '
    color = gets.chomp

    label = Label.new(title: title, color: color)
    label.add_item(item)
    @labels.push(label)
  end

  def add_source(item)
    puts "\n Enter the source details of the item:\n"
    print '  Name: '
    name = gets.chomp

    source = Source.new(name: name)
    source.add_item(item)
    @sources.push(source)
  end
end
