require_relative '../src/genre'
require_relative '../src/book'

describe Genre do
  describe 'check name' do
    context 'test for Genre' do
      genre = Genre.new(name: 'pen')

      it 'should be equal to pen and id shouldn\'t be equal to 0' do
        expect(genre.name).to eq 'pen'
        expect(genre.id).to satisfy(&:positive?)
      end
    end
  end
  describe 'check the content of it propriety items' do
    context 'test for Book' do
      genre = Genre.new(name: 'pen')
      book = Book.new(publish_date: '2021/01/10', publisher: 'shou', cover_state: true, archived: false)
      genre.add_item(book)
      # puts genre.inspect
      it 'should be equal to 1' do
        expect(genre.items.length).to eq 2
      end
    end
  end
end
