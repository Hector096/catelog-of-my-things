require_relative 'modules/create_book'
require_relative 'label'

class Main
    include CreateBook
    attr_accessor :labels

    def initialize
        @books = []
        @labels = []
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
        when '4'
            
        when '7'
            
        when '12'
            
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

