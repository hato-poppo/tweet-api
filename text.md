# 研修用APIについて

## API要件

* DBはMySQL（またはMariaDB）を使用
* DB名は「」　※未定
  * 今回の場合は命名で時間を取って欲しくない
* Tableは「users」と「tweets」
  * 今回の場合は命名で時間を取って欲しくない

## 実際の手順

```sh
$ rails new . -d mysql --skip-test --api --minimal
# database.yml 書き換え
$ rails db:create
$ rails g model user
# users テーブル作成
$ rails g model tweet
# tweets テーブル作成
$ rails g controller tweets
# ルーティング設定&確認
$ rails routes
Prefix Verb   URI Pattern           Controller#Action
tweets GET    /tweets(.:format)     tweets#index
       POST   /tweets(.:format)     tweets#create
 tweet GET    /tweets/:id(.:format) tweets#show
       PATCH  /tweets/:id(.:format) tweets#update
       PUT    /tweets/:id(.:format) tweets#update
       DELETE /tweets/:id(.:format) tweets#destroy

# ユーザー追加
INSERT INTO tweet_development.users
  (name, account_name, password, email, is_deleted)
VALUES
  ('yoshinaga-k', '義永@SPE', 'PassW0rd!', 'yoshinaga-k@spp.co.jp', 0);


$ curl -X GET http://localhost:3000/tweets
[]

# $ curl -X POST -d ‘{“user_id":1, "content": "テスト投稿です"}' http://localhost:3000/tweets

$ curl -X POST -d 'tweet[user_id]=1&tweet[content]=テスト投稿です' http://localhost:3000/tweets
{"id":1,"user_id":1,"content":"テスト投稿です","created_at":"2021-05-14T23:53:21.000Z","updated_at":"2021-05-14T23:53:21.000Z"}

$ curl -X GET http://localhost:3000/tweets/1
{"id":1,"user_id":1,"content":"テスト投稿です","created_at":"2021-05-14T23:53:21.000Z","updated_at":"2021-05-14T23:53:21.000Z"}

$ curl -X PUT -d 'tweet[content]=編集されたテスト投稿です' http://localhost:3000/tweets/1
{"content":"編集されたテスト投稿です","id":1,"user_id":1,"created_at":"2021-05-14T23:53:21.000Z","updated_at":"2021-05-15T00:04:01.000Z"}

$ curl -X GET http://localhost:3000/tweets
[{"id":1,"user_id":1,"content":"編集されたテスト投稿です","created_at":"2021-05-14T23:53:21.000Z","updated_at":"2021-05-15T00:04:01.000Z"}]

$ curl -X DELETE http://localhost:3000/tweets/1
{"id":1,"user_id":1,"content":"編集されたテスト投稿です","created_at":"2021-05-14T23:53:21.000Z","updated_at":"2021-05-15T00:04:01.000Z"}

$ curl -X GET http://localhost:3000/tweets
[]
```
