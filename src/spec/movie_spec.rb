require_relative 'spec_helper'

describe Movie do
  describe 'can move to archive' do
    context 'if publish date is older than 10 years or silent' do
      movie = Movie.new(publish_date: '2011/12/09', silent: true)
      it 'should return true' do
        expect(movie.can_be_archived?).to eq true
        expect(movie.can_be_archived?).to be_truthy
      end
    end

    context 'if publish date is older than 10 years but not silent' do
      movie = Movie.new(publish_date: '2011/12/09', silent: false)
      it 'should return true' do
        expect(movie.can_be_archived?).to eq true
        expect(movie.can_be_archived?).to be_truthy
      end
    end

    context 'if publish date is under 10 years but silent' do
      movie = Movie.new(publish_date: '2019/12/09', silent: true)
      it 'should return true' do
        expect(movie.can_be_archived?).to eq true
        expect(movie.can_be_archived?).to be_truthy
      end
    end

    context 'if publish date is under 10 years and not silent' do
      movie = Movie.new(publish_date: '2019/12/09', silent: false)
      it 'should return false' do
        expect(movie.can_be_archived?).to eq false
        expect(movie.can_be_archived?).to be_falsey
      end
    end
  end
end
