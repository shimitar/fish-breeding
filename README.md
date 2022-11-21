# README


# アプリケーション名

## Fish Breeding

# アプリケーション概要

魚や飼育環境の情報を投稿し、ユーザー同士で閲覧や情報交換の場となること、飼育していない人も飼育できる様になることを目指しています。

# URL
https://fish-breeding.onrender.com

# テスト用アカウント
## ユーザー1
太郎
## Eメールアドレス
test@test.com
## パスワード
aaaaaa1
## ユーザー2
A
## Eメールアドレス
test@test
## パスワード
aaaaaa
# 利用方法

魚や飼育環境の投稿
***
1.トップページから新規登録  
またはログインを行います。  
2.トップページに投稿ボタンが表示されるので、クリックします。  
3.投稿ページに魚の名前、大きさ、カテゴリーを入力します。（必須）  
水槽の大きさ、水温、使っているフィルター、ライト、水質、底砂、水草の項目は、その魚の飼育環境の情報を入力します。(任意)入力を終えたら、投稿ボタンを押します。  
4.トップページに投稿した魚の情報が一覧で表示される様になっていて、魚の名前をクリックすると詳細画面に遷移することができます。  
5.投稿したユーザーは詳細画面にあるアイコンを押すと、投稿した魚の情報、飼育環境の情報を編集することができます。また、削除アイコンをクリックすると削除することができます。
6.投稿していないユーザーは、詳細画面にある質問アイコンをクリックすると質問画面に遷移することができます。  
7.質問でフォームに質問内容を入力すると質問を投稿することができます。  
8.魚の情報を投稿したユーザーは、詳細画面に表示された質問内容の左にある質問という文字をクリックすると解答画面に遷移することができます。  
9.解答画面のフォームに解答を入力すると解答を投稿することができます。

# アプリケーションを作成した背景
魚の飼育方法はネットや書籍に載っていますが、あまり情報がなかったり、実際に飼ってみないとわからないこともあります。そのような情報を共有できるアプリがあったら便利ではないかと思い、開発を行いました。
# 洗い出した要件
要件定義シート(https://docs.google.com/spreadsheets/d/17h_l79aCJKAaovFFf23YaokSXb7rN4NowO0-Nu2mejg/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明
ユーザーの新規登録機能
(https://gyazo.com/5e128a8d9c91aa47697cfbba1ac22f18)  
Eメールとパスワードとニックネームを入力することでユーザーの新規登録をすることができます。ログインしているとトップページに『こんにちは(ユーザー名)さん』と表示される様にしています。  
  
新規投稿機能
(https://gyazo.com/70b7e3b4cd86a3506c50a8c63371d7e8)  
魚の情報(必須)と飼育環境(任意)を入力すると魚の新規投稿を行うことができます。  
  
一覧機能
(https://gyazo.com/728b7ba0c6206aa80bac609a229b0199)  
投稿した魚の情報はトップページに一覧で表示されます。投稿の画像、名前、投稿者のユーザー名が投稿ごとに表示されます。  
  
詳細表示機能
(https://gyazo.com/04480721a736a065d13b0c323d9837f9)  
トップページの一覧の魚の名前をクリックすると詳細画面に遷移し、魚の情報と飼育環境の情報を閲覧することができます。  
  
削除機能
(https://gyazo.com/00464592377794ce4b5b825cb02c9b6d)  
投稿者は自身が投稿した魚の情報を削除することができます。削除されると、画面に『削除しました』という表示がされた後にトップページに遷移します。データベースから削除されたので、トップページの一覧に表示されなくなります。  
  
質問機能
(https://gyazo.com/73901cfe6e7268ab2919a878565becf8)  
投稿者以外のユーザーは詳細画面にある質問のアイコンをクリックすると質問画面に遷移し、質問を入力することができます。
質問を入力すると詳細画面に表示される様になります。  
  
解答機能
(https://gyazo.com/35a1610598ae1290c737534e42ddac43)  
投稿者本人は詳細画面にある質問内容の左の質問の文字をクリックすると解答画面に遷移できます。解答画面に解答を入力すると解答することができます。解答は詳細画面に表示される様になります。  
  





# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ------------------------|
| email              | string | null: false unique: true|
| encrypted_password | string | null: false             |
| nickname           | string | null: false             |

### Association
- has_many :fishes
- has_many :breedings
- has_many :questions
- has_many :Answers

## fishes テーブル

| Column            | Type       | Options                       |
| ------------------| ---------- | ------------------------------|
| name              | string     | null: false                   |
| size              | string     | null: false                   |
| fish_text         | text       | null: false                   |
| category_id       | integer    | null: false                   |
| user              | references | null: false, foreign_key: true|
### Association
- belongs_to :user
- has_one    :breeding
- has_many   :questions
- has_many   :answers

## questions テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| question_text| text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| fish         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :fish
- has_many :answers


## answers テーブル

| Column     | Type       | Options                        |
| -----------| ---------- | ------------------------------ |
| answer_text| text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| fish       | references | null: false, foreign_key: true |
| question   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :fish
- belongs_to :question

## breeds テーブル
| Column            | Type       | Options                       |
| ------------------| ---------- | ------------------------------|
| tank_size         | string     |                               |
| temperature       | string     |                               |
| filter            | string     |                               |
| raito             | string     |                               |
| condition         | string     |                               |
| sand              | string     |                               |
| plant             | string     |                               |
| breeding_text     | string     |                               |
| user              | references | null: false, foreign_key: true|
| fish              | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :fish

# データベース設計
# ER図
https://gyazo.com/7b0ca3fdc2de444d0950d61e48f788af
# 画面遷移図
https://gyazo.com/aa031b2ce16ca83624eb001fdbab2ac4
# 開発環境
- フロントエンド
- バックエンド
- テスト
- テキストエディタ
- github

# 工夫したポイント
魚の情報と飼育環境の情報を一度に保存できる様にするためにFormオブジェクトを使って2つのモデルを操作できる様にし、新規投稿の保存を実現しました。



