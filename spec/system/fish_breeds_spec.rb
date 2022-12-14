require 'rails_helper'


RSpec.describe "魚と飼育環境の情報保存", type: :system do
      before do
        @user = FactoryBot.create(:user)
        @fish_breed = FactoryBot.build(:fish_breed, user_id: @user.id)
        sleep(1)
      end
  

 context '魚と飼育環境の情報保存ができるとき'do
  it 'ログインしたユーザーは新規投稿できる' do
    # ログインする
    visit new_user_session_path
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    # 新規投稿ページへのボタンがあることを確認する
    expect(page).to have_content('投稿する')
    # 投稿ページに移動する
    visit new_fish_path
    # フォームに情報を入力する
    fill_in "fish_breed[name]", with:@fish_breed.name
    fill_in "fish_breed[size]", with: @fish_breed.size
    fill_in "fish_breed[fish_text]", with: @fish_breed.fish_text
    select "カラシン", from: "fish_breed[category_id]"
    attach_file("fish_breed[image]", Rails.root.join("public/images/test_image.png"))
    # 送信するとFishモデルとBreedモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Fish.count & Breed.count }.by(1)
    # トップページに遷移する
    visit root_path
    # トップページには先ほど投稿した内容の画像が存在することを確認する
    expect(page).to have_content(@fish_breed.image)
    # トップページには先ほど投稿した内容の魚の名前が存在することを確認する
    expect(page).to have_content(@fish_breed.name)
  end
 end

  context 'ツイート投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
     # トップページに遷移する
     visit root_path
     # 新規投稿ページへのボタンがないことを確認する
     expect(page).to have_no_content('投稿する')
    end
  end
end
