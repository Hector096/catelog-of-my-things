require 'rainbow'
require_relative 'modules/create_author'
require_relative 'modules/create_book'
require_relative 'modules/create_game'
require_relative 'modules/create_genre'
require_relative 'modules/create_label'
require_relative 'modules/create_movie'
require_relative 'modules/create_source'
require_relative 'label'

class Main
    include CreateBook
    include SourceModule
    include CreateMusic
    include LabelModule
    include GenreModule
    include CreateGame
    include AuthorModule

    def initialize
        @active = true
        @books = []
        @games = []
        @labels = []
        @genres = []
        @music_albums = []
        @sources = []
        @authors = []
        @movies = []
    end

    def options
        available = {
            '1' => 'List all books',
            '2' => 'List all music albums',
            '3' => 'List all movies',
            '4' => 'List all games',
            '5' => 'List all genres',
            '6' => 'List all labels',
            '7' => 'List all author',
            '8' => 'List all sources',
            '9' => 'Add a book',
            '10' => 'Add a music album',
            '11' => 'Add a movie',
            '12' => 'Add a game',
            '13' => 'Exit'
        }
        puts 'Please choose an option by enterin a number:'
        available.each { |key, value| puts "#{key} - #{value}" }
    end

    def handle_number
        choice = gets.chomp
        case choice
        when '1'
            book_list
        when '2'
            album_list
        when '3'
        when '4'
            game_list
        when '5'
            genre_list
        when '6'
            label_list
        when '7'
            author_list
        when '8'
            source_list
        when '9'
            create_book_list
        when '10'
            create_music_album
        when '11'
        when '12'
            create_game_list
        when '13'
            @active = false
            puts 'Thank you for using  this app!'
        end
    end

    def run
        puts 'welcome'
        puts ''
        while @active
            options
            handle_number
        end
    end
end

def app
  application = Main.new
  application.run
end
app