require 'rails_helper'

RSpec.describe Breed, type: :model do
  describe '魚の新規投稿' do
    before do
      user = FactoryBot.create(:user)
      fish = FactoryBot.create(:fish)
      @breed = FactoryBot.build(:breed, user_id: user.id, fish_id: fish.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@breed).to be_valid
      end
      it '水槽の大きさは空でも保存できる' do
        @breed.tank_size = ''
        expect(@breed).to be_valid
      end
      it '水温は空でも保存できる' do
        @breed.temperature = ''
        expect(@breed).to be_valid
      end
      it '使っているフィルターは空でも保存できる' do
        @breed.filter = ''
        expect(@breed).to be_valid
      end
      it '使っているライトは空でも保存できる' do
        @breed.raito = ''
        expect(@breed).to be_valid
      end
      it '水質は空でも保存できる' do
        @breed.condition = ''
        expect(@breed).to be_valid
      end
      it '底砂は空でも保存できる' do
        @breed.sand = ''
        expect(@breed).to be_valid
      end
      it '飼育環境は空でも保存できる' do
        @breed.breeding_text = ''
        expect(@breed).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'ユーザーが紐付いていないと保存できない' do
        @breed.user_id = nil
        @breed.valid?
        expect(@breed.errors.full_messages).to include('ユーザーを入力してください')
      end
      it '魚の情報が紐付いていないと保存できない' do
        @breed.fish_id = nil
        @breed.valid?
        expect(@breed.errors.full_messages).to include('魚の情報を入力してください')
      end
    end
  end
end
