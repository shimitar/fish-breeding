require 'rails_helper'

RSpec.describe Fish, type: :model do
  describe '魚の情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @fish = FactoryBot.build(:fish, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@fish).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it '魚の名前が空だと保存できない' do
        @fish.name = ''
        @fish.valid?
        expect(@fish.errors.full_messages).to include('魚の名前を入力してください')
      end
      it '魚の大きさが空だと保存できない' do
        @fish.size = ''
        @fish.valid?
        expect(@fish.errors.full_messages).to include('魚の大きさを入力してください')
      end
      it '魚の大きさにcmかmを入力しないと保存できない' do
        @fish.size = '10'
        @fish.valid?
        expect(@fish.errors.full_messages).to include('魚の大きさは不正な値です')
      end
      it '魚のカテゴリーを選択していないと保存できない' do
        @fish.category_id = 1
        @fish.valid?
        expect(@fish.errors.full_messages).to include('魚のカテゴリーを入力してください')
      end
      it '魚の説明が空だと保存できない' do
        @fish.fish_text = ''
        @fish.valid?
        expect(@fish.errors.full_messages).to include('魚の説明を入力してください')
      end
      it 'ユーザーが紐付いていないと保存できない' do
        @fish.user_id = nil
        @fish.valid?
        expect(@fish.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
