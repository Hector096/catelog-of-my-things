require_relative '../author'
require_relative '../genre'
require_relative '../label'
require_relative '../source'
require_relative '../movie'
require_relative '../music_album'
require_relative 'main_methods'
require_relative 'create_book'
require_relative 'create_game'

module CreateMovie
  include MainMethods

  def save_movie
    File.write('json/movie.json', JSON.dump(@movies))
  end

  def read_movies
    return unless File.exist?('json/movie.json')

    file = File.read('json/movie.json')
    file_data = JSON.parse(file)
    file_data.each do |movie|
        movie_instance = Movie.new(silent:movie['silent'], publish_date:movie['date'])
      label_instance = Label.new(title:movie['title'], color: movie['color'])
      movie_instance.label = label_instance
      @movies.push(movie_instance)
    end
  end

  def save_source
    File.write('json/source.json', JSON.dump(@sources))
  end

  def read_source
    return unless File.exist?('json/source.json')

    file = File.read('json/source.json')
    file_data = JSON.parse(file)
    file_data.each do |source|
      new_source = Source.new(name: source['name'])
      @sources.push(new_source)
    end
  end

  def create_movie
    puts "\n When was the release date?(yyyy/mm/dd) "
    publish_date = gets.chomp

    print ' Silent?'
    silent = gets.chomp

    new_movie = Movie.new(silent: silent, publish_date: publish_date)

    add_author(new_movie)
    add_genre(new_movie)
    add_label(new_movie)
    add_source(new_movie)

    save_genre
    save_label
    save_author
    save_source

    @movies.push(new_movie)

    save_movie

    puts Rainbow("\n Movie created!").indianred.bright
    puts Rainbow('-----------------').indianred.bright
  end

  def movie_list
    if @movies.length.zero?
      puts Rainbow("\n No movie added yet!").red.bright
      puts Rainbow('----------------------').red.bright
    else
      puts Rainbow("\n List of Movies:\n").aqua.bright.underline
      @movies.each_with_index do |movie, index|
        print " #{index + 1}. Movie title: #{movie.label.title}\n  - "
        print " Published on: #{movie.publish_date}\n  - Silent #{movie.silent}\n"
        puts Rainbow("__________________________________________\n").aqua.bright
      end
    end
  end
end
