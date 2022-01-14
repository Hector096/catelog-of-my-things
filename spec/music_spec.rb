require_relative 'spec_helper'

describe MusicAlbum do
  describe 'can move to archive' do
    context 'if publish date is older than 10 years and is on spotify' do
      music = MusicAlbum.new(publish_date: '2011/12/09', on_spotify: true)
      it 'should return true' do
        expect(music.can_be_archived?).to eq true
        expect(music.can_be_archived?).to be_truthy
      end
    end

    context 'if publish date is older than 10 years and is not on spotify' do
      music = MusicAlbum.new(publish_date: '2011/12/09', on_spotify: false)
      it 'should return false' do
        expect(music.can_be_archived?).to eq false
        expect(music.can_be_archived?).to be_falsey
      end
    end

    context 'if publish date is less than 10 years and is on spotify' do
      music = MusicAlbum.new(publish_date: '2019/12/09', on_spotify: true)
      it 'should return false' do
        expect(music.can_be_archived?).to eq false
        expect(music.can_be_archived?).to be_falsey
      end
    end

    context 'if publish date is less than 10 years and is not on spotify' do
      music = MusicAlbum.new(publish_date: '2019/12/09', on_spotify: false)
      it 'should return false' do
        expect(music.can_be_archived?).to eq false
        expect(music.can_be_archived?).to be_falsey
      end
    end
  end
end
