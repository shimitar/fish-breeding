require 'rails_helper'

RSpec.describe Question, type: :model do
  describe '質問の新規投稿' do
    before do
      user = FactoryBot.create(:user)
      fish = FactoryBot.create(:fish)
      @question = FactoryBot.build(:question, user_id: user.id, fish_id: fish.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@question).to be_valid
      end
    end
      context '内容に問題がある場合' do
        it '質問が空だと保存できない' do
          @question.question_text = ''
          @question.valid?
          expect(@question.errors.full_messages).to include("質問を入力してください")
        end
        it 'ユーザーが紐付いていないと保存できない' do
          @question.user_id = nil
          @question.valid?
          expect(@question.errors.full_messages).to include("ユーザーを入力してください")
        end
        it '魚の情報が紐付いていないと保存できない' do
          @question.fish_id = nil
          @question.valid?
          expect(@question.errors.full_messages).to include("魚の情報を入力してください")
        end
      end
   end
end
