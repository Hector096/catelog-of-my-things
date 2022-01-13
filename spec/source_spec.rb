require_relative '../src/source'
require_relative '../src/book'

describe Source do
  describe 'check name' do
    context 'test for Source' do
      source = Source.new(name: 'SAIDI')

      it 'should be equal to pen and id shouldn\'t be equal to 0' do
        expect(source.name).to eq 'SAIDI'
        expect(source.id).to satisfy(&:positive?)
      end
    end
  end
  describe 'check the content of it propriety items' do
    context 'test for Book' do
      source = Source.new(name: 'SAIDI')
      book = Book.new(publish_date: '2021/01/10', publisher: 'shou',
                      cover_state: true, archived: false)
      source.add_item(book)
      # puts genre.inspect
      it 'should be equal to 1' do
        expect(source.items.length).to eq 2
        expect(source.name).to eq 'SAIDI'
      end
    end
  end
end
