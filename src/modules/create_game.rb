require_relative '../author'
require_relative '../genre'
require_relative '../label'
require_relative '../game'
require_relative 'main_methods'
require_relative 'create_music'
require_relative 'create_book'
require_relative 'create_movie'

module CreateGame
  include MainMethods

  def save_game
    File.write('json/game.json', JSON.dump(@games))
  end

  def read_games
    return unless File.exist?('json/game.json')

    file = File.read('json/game.json')
    file_data = JSON.parse(file)
    file_data.each do |game|
      game_instance = Game.new(multiplayer: game['multiplayer'], last_played_at: game['last_played_at'],
                               publish_date: game['publish_date'])
      label_instance = Label.new(title: game['title'], color: game['color'])
      game_instance.label = label_instance
      @games.push(game_instance)
    end
  end

  def save_author
    File.write('json/author.json', JSON.dump(@authors))
  end

  def read_author
    return unless File.exist?('json/author.json')

    file = File.read('json/author.json')
    file_data = JSON.parse(file)
    file_data.each do |author|
      new_author = Author.new(first_name: author['first_name'], last_name: author['last_name'])
      @authors.push(new_author)
    end
  end

  def create_game_list
    print "\n Enter the number of players: "
    number_of_players = gets.chomp

    print ' When last was the game played?(yyyy/mm/dd): '
    date_of = gets.chomp

    print ' When was the game published?(yyyy/mm/dd): '
    publish_date = gets.chomp

    new_game = Game.new(multiplayer: number_of_players, last_played_at: date_of, publish_date: publish_date)

    add_author(new_game)
    add_genre(new_game)
    add_label(new_game)
    add_source(new_source)

    save_author
    save_genre
    save_label
    save_source

    @games.push(new_game)

    save_game

    puts Rainbow("\n Game created!").indianred.bright
    puts Rainbow('-----------------').indianred.bright
  end

  def game_list
    if @games.length.zero?
      puts Rainbow("\n No games added yet!").red.bright
      puts Rainbow('----------------------').red.bright
    else
      puts Rainbow("\n List of games:\n").aqua.bright.underline
      @games.each_with_index do |game, index|
        print " #{index + 1}. Game name: #{game.label.title}\n  - "
        print "Number of players: #{game.multiplayer}\n  - Last played on: #{game.last_played_at}\n"
        puts Rainbow("__________________________________________\n").aqua.bright
      end
    end
  end
end
