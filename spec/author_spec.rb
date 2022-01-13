require_relative '../src/author'
require_relative '../src/book'

describe Author do
  describe 'check name' do
    context 'test for Author' do
      author = Author.new(last_name: 'SAIDI', first_name: 'ALLY')

      it 'should be equal to pen and id shouldn\'t be equal to 0' do
        expect(author.last_name).to eq 'SAIDI'
        expect(author.id).to satisfy(&:positive?)
      end
    end
  end
  describe 'check the content of it propriety items' do
    context 'test for Book' do
      author = Author.new(last_name: 'SAIDI', first_name: 'ALLY')
      book = Book.new(publish_date: '2021/01/10', publisher: 'shou',
                      cover_state: true, archived: false)
      author.add_item(book)
      # puts genre.inspect
      it 'should be equal to 1' do
        expect(author.items.length).to eq 2
        expect(author.first_name).to eq 'ALLY'
      end
    end
  end
end
