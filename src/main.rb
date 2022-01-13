require_relative 'modules/create_book'
require_relative 'label'

class Main
include CreateBook

attr_accessor :labels

def initialize ()
    @books = []
    @labels = []
end



end

