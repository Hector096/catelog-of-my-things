require_relative 'spec_helper'

describe Book do
  describe 'can move to archive' do
    context 'if publish date is older than 10 years and cover state is bad' do
      book = Book.new(publish_date: '2011/12/09', publisher: 'leya', cover_state: 'bad')
      it 'should return true' do
        expect(book.can_be_archived?).to eq true
        expect(book.can_be_archived?).to be_truthy
      end
    end

    context 'if publish date is older than 10 years and cover state is good' do
      book = Book.new(publish_date: '2011/12/09', publisher: 'leya', cover_state: 'good')
      it 'should return true' do
        expect(book.can_be_archived?).to eq true
        expect(book.can_be_archived?).to be_truthy
      end
    end

    context 'if publish date is less than 10 years and cover state is bad' do
      book = Book.new(publish_date: '2019/12/09', publisher: 'leya', cover_state: 'bad')
      it 'should return true' do
        expect(book.can_be_archived?).to eq true
        expect(book.can_be_archived?).to be_truthy
      end
    end

    context 'if publish date is less than 10 years and cover state is good' do
      book = Book.new(publish_date: '2019/12/09', publisher: 'leya', cover_state: 'good')
      it 'should return false' do
        expect(book.can_be_archived?).to eq false
        expect(book.can_be_archived?).to be_falsey
      end
    end
  end
end
