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
またはログインを行う。  
2.トップページに投稿ボタンが表示されるので、クリックする。  
3.投稿ページに魚の名前、大きさ、カテゴリーを入力する。（必須）  
水槽の大きさ、水温、使っているフィルター、ライト、水質、底砂、水草の項目は、その魚の飼育環境の情報を入力する。(任意)入力を終えたら、投稿ボタンを押す。  
4.トップページに投稿した魚の情報が一覧で表示される様になっていて、魚の名前をクリックすると詳細画面に遷移することができる。  
5.投稿したユーザーは詳細画面にあるアイコンを押すと、投稿した魚の情報、飼育環境の情報を編集することができる。また、削除アイコンをクリックすると削除することができる。
6.投稿していないユーザーは、詳細画面にある質問アイコンをクリックすると質問画面に遷移することができる。  
7.質問でフォームに質問内容を入力すると質問を投稿することができる。  
8.魚の情報を投稿したユーザーは、詳細画面に表示された質問内容の左にある質問という文字をクリックすると解答画面に遷移することができる。  
9.解答画面のフォームに解答を入力すると解答を投稿することができる。

# アプリケーションを作成した背景
魚の飼育方法はネットや書籍に載っていますが、あまり情報がなかったり、実際に飼ってみないとわからないこともあります。そのような情報を共有できるアプリがあったら便利ではないかと思い、開発を行いました。
# 洗い出した要件
要件定義シート(https://docs.google.com/spreadsheets/d/17h_l79aCJKAaovFFf23YaokSXb7rN4NowO0-Nu2mejg/edit#gid=982722306)

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
https://gyazo.com/2d8cf8f002f7d73dd4eea54bfe53801c
# 画面遷移図
https://gyazo.com/6398dc55eefbfbe3f4ebb5f2ee4181f4
# 開発環境
- フロントエンド
- バックエンド
- テスト
- テキストエディタ

# 工夫したポイント
魚の情報と飼育環境の情報を一度に保存できる様にするためにFormオブジェクトを使って2つのモデルを操作できる様にし、新規投稿の保存を実現しました。



