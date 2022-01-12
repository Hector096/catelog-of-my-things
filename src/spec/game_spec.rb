require_relative 'spec_helper'

describe Game do
    describe 'can move to archive' do
      context 'if publish date is older than 10 years and last time played over 2 years' do
        game = Game.new(publish_date: '2011/12/09', multiplayer: true, last_played_at: '2015/07/10')
        it 'should return true' do
          expect(game.can_be_archived?).to eq true
          expect(game.can_be_archived?).to be_truthy
        end
      end

      context 'if publish date is older than 10 years and last time played less than 2 years' do
        game = Game.new(publish_date: '2011/12/09', multiplayer: true, last_played_at: '2022/01/02')
        it 'should return false' do
          expect(game.can_be_archived?).to eq false
          expect(game.can_be_archived?).to be_falsey
        end
      end

      context 'if publish date is less than 10 years and last time played over than 2 years' do
        game = Game.new(publish_date: '2019/12/09', multiplayer: true, last_played_at: '2015/01/02')
        it 'should return false' do
          expect(game.can_be_archived?).to eq false
          expect(game.can_be_archived?).to be_falsey
        end
      end

      context 'if publish date is less than 10 years and last time played less than 2 years' do
        game = Game.new(publish_date: '2019/12/09', multiplayer: true, last_played_at: '2022/01/02')
        it 'should return false' do
          expect(game.can_be_archived?).to eq false
          expect(game.can_be_archived?).to be_falsey
        end
      end
    end
end