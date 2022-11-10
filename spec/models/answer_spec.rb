require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe '解答の新規投稿' do
    before do
      user = FactoryBot.create(:user)
      fish = FactoryBot.create(:fish)
      question = FactoryBot.create(:question)
      @answer = FactoryBot.build(:answer, user_id: user.id, fish_id: fish.id, question_id: question.id)
      sleep(1)
    end
  end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@answer).to be_valid
      end
    end
      context '内容に問題がある場合' do
        it 'ユーザーが紐付いていないと保存できない' do
          @answer.user_id = nil
          @answer.valid?
          expect(@answer.errors.full_messages).to include("ユーザーを入力してください")
        end
        it '魚の情報が紐付いていないと保存できない' do
          @answer.fish_id = nil
          @answer.valid?
          expect(@answer.errors.full_messages).to include("魚の情報を入力してください")
        end
        it '質問が紐付いていないと保存できない' do
          @answer.question_id = nil
          @answer.valid?
          expect(@answer.errors.full_messages).to include("質問を入力してください")
        end
    end
end
