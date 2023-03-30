# アプリケーション名
マッチングゲーム

# アプリケーション概要
APEXというFPSゲームを人に教えてあげたい人と教えてもらいたい人がマッチングできるアプリです。

# URL
https://matching-game-e9xk.onrender.com

# テスト用アカウント



# 利用方法
ユーザー登録をし、教えてあげたい人は自分の情報とともにコーチング回数や値段を設定して売りに出します。
教えてもらいたい人は、ユーザー登録をしたうえで売られているコーチングから好きなものを選んで購入します。
マッチングが成立すると、2人のルームが作成され、会話ができるようになります。

# アプリケーションを作成した背景


# 洗い出した要件

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能

# データベース設計

# 画面遷移図

# 開発環境

# ローカルでの動作方法

# 工夫したポイント





## Users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| game_name          | string  | null: false               |


### Association
has_many :coaches
has_many :orders
has_many :rooms



## Coaches テーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| rank_id            | integer    | null: false                    |
| kill_rate          | string     | null: false                    |
| character          | text       | null: false                    |
| play_style         | string     |                                |
| play_time          | string     | null: false                    |
| play_device        | text       | null: false                    |
| communication_tool | text       | null: false                    |
| price              | string     | null: false                    |
| times_to_teach     | string     | null: false                    |
| rank_limit_id      | integer    | null: false                    |
| appeal_point       | text       | null: false                    |


### Association
belongs_to :user
has_many :rooms


## Orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| coach  | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :coach
has_one :payment


## Payments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| coach              | references | null: false, foreign_key: true |
| rank_id            | integer    | null: false                    |
| character          | text       | null: false                    |
| play_style         | string     |                                |
| play_time          | string     | null: false                    |
| play_device        | text       | null: false                    |
| communication_tool | text       | null: false                    |
| goal               | text       | null: false                    |


### Association
belongs_to :order
has_one :room


## Rooms テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| coach   | references | null: false, foreign_key: true |
| payment | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :coach
belongs_to :payment