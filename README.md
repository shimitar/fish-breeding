# README


# アプリケーション名

Fish Breeding

# アプリケーション概要

魚や飼育環境の情報を投稿し、ユーザー同士で閲覧や情報交換の場となる。

# URL


# テスト用アカウント

# 利用方法

魚や飼育環境の投稿
***
1.トップページから新規登録  
またはログインを行う。  
2.トップページに投稿ボタンが表示されるので、クリックする。  
3.投稿ページに魚の名前、大きさ、カテゴリーを入力する。（必須）  
水槽の大きさ、水温、使っているフィルター、ライト、水質、底砂、水草の項目は、その魚の飼育環境の情報を入力する。(任意)入力を終えたら、投稿ボタンを押す。  
# アプリケーションを作成した背景
魚の飼育方法は、ネットや書籍に載っているが、少ししか情報がなかったり、実際に飼ってみないとわからないこともあるので
そのような情報を共有できるアプリがあったら便利ではないかと思い、開発を行った。
# 洗い出した要件
要件定義シート(https://docs.google.com/spreadsheets/d/17h_l79aCJKAaovFFf23YaokSXb7rN4NowO0-Nu2mejg/edit#gid=982722306)
# 実装した機能についての画像やGIF及びその説明

# 実装予定の機能

# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ------------------------|
| email              | string | null: false unique: true|
| encrypted_password | string | null: false             |
| nickname           | string | null: false             |

### Association
- has_many :fishes
- has_many :questions
- has_many :Answers

## fishes テーブル

| Column            | Type       | Options                       |
| ------------------| ---------- | ------------------------------|
| name              | string     | null: false                   |
| size              | string     | null: false                   |
| fish_text         | text       | null: false                   |
| category_id       | integer    | null: false                   |

### Association
- belongs_to :user
- has_one    :breeding

## questions テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| question_text| text       | null: false                    |
| user         | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_many :answers

## answers テーブル

| Column     | Type       | Options                        |
| -----------| ---------- | ------------------------------ |
| answer_text| text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| question   | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :question

## breedings テーブル
| Column            | Type       | Options                       |
| ------------------| ---------- | ------------------------------|
| tank_size         | string     |                               |
| temperature       | string     |                               |
| filter            | string     |                               |
| raito             | string     |                               |
| condition         | string     |                               |
| sand              | string     |                               |
| plant             | string     |                               |
| user              | references | null: false, foreign_key: true|
| fish              | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :fish 

# データベース設計

# 画面遷移図

# 開発環境
- フロントエンド
- バックエンド
- テスト
- テキストエディタ

# 工夫したポイント



