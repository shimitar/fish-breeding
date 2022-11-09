require 'rails_helper'

RSpec.describe FishBreed, type: :model do
  describe '魚の新規投稿' do
    before do
      user = FactoryBot.create(:user)
      @fish_breed = FactoryBot.build(:fish_breed, user_id: user.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@fish_breed).to be_valid
      end
      it '水槽の大きさは空でも保存できる' do
        @fish_breed.tank_size = ''
        expect(@fish_breed).to be_valid
      end
      it '水温は空でも保存できる' do
        @fish_breed.temperature = ''
        expect(@fish_breed).to be_valid
      end
      it '使っているフィルターは空でも保存できる' do
        @fish_breed.filter = ''
        expect(@fish_breed).to be_valid
      end
      it '使っているライトは空でも保存できる' do
        @fish_breed.raito = ''
        expect(@fish_breed).to be_valid
      end
      it '水質は空でも保存できる' do
        @fish_breed.condition = ''
        expect(@fish_breed).to be_valid
      end
      it '底砂は空でも保存できる' do
        @fish_breed.sand = ''
        expect(@fish_breed).to be_valid
      end
      it '飼育環境は空でも保存できる' do
        @fish_breed.breeding_text = ''
        expect(@fish_breed).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '魚の名前が空だと保存できない' do
        @fish_breed.name = ''
        @fish_breed.valid?
        expect(@fish_breed.errors.full_messages).to include("魚の名前を入力してください")
      end
      it '魚の大きさが空だと保存できない' do
        @fish_breed.size = ''
        @fish_breed.valid?
        expect(@fish_breed.errors.full_messages).to include("魚の大きさを入力してください")
      end
      it '魚の大きさにcmかmを入力しないと保存できない' do
        @fish_breed.size = '10'
        @fish_breed.valid?
        expect(@fish_breed.errors.full_messages).to include("魚の大きさは不正な値です")
      end
      it '魚のカテゴリーを選択していないと保存できない' do
        @fish_breed.category_id = 1
        @fish_breed.valid?
        expect(@fish_breed.errors.full_messages).to include("魚のカテゴリーを入力してください")
      end
      it '魚の説明が空だと保存できない' do
        @fish_breed.fish_text = ''
        @fish_breed.valid?
        expect(@fish_breed.errors.full_messages).to include("魚の説明を入力してください")
      end
      it 'ユーザーが紐付いていないと保存できない' do
        @fish_breed.user_id = nil
        @fish_breed.valid?
        expect(@fish_breed.errors.full_messages).to include("ユーザーを入力してください")
      end
    end
  end
end
