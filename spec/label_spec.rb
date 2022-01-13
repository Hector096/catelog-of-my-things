require_relative '../src/label'
require_relative '../src/book'

describe Label do
  describe 'check name' do
    context 'test for Label' do
      label = Label.new(title: 'anten', color: 'blue')

      it 'should be equal to pen and id shouldn\'t be equal to 0' do
        expect(label.title).to eq 'anten'
        expect(label.id).to satisfy(&:positive?)
      end
    end
  end
  describe 'check the content of it propriety items' do
    context 'test for Book' do
      label = Label.new(title: 'anten', color: 'blue')
      book = Book.new(publish_date: '2021/01/10', publisher: 'shou',
                      cover_state: true, archived: false)
      label.add_item(book)
      # puts genre.inspect
      # put some comment about the test
      it 'should be equal to 1' do
        expect(label.items.length).to eq 2
        expect(label.color).to eq 'blue'
      end
    end
  end
end
