# 社内用書籍管理アプリ

社内に置いてある書籍の貸し借りを管理するアプリを作成しました

## 機能・仕様

### 機能

- サインイン・ログイン
- 書籍一覧表示、登録、編集
- 書籍を借りる・返す
- 借りている書籍一覧

### 仕様

- 所蔵数より多くは貸出できない
- 所蔵数は現在貸出中の数より少なく変更できない
- 同一アカウントで同一書籍は1冊まで借りられる

## Demo

### Heroku

https://afternoon-anchorage-92073.herokuapp.com

### GKE(IPアドレスが変わりました)

http://35.221.99.141/

## Getting Started

```bash
docker-compose build
docker-compose run -u root web bundle
docker-compose run web rails db:create
docker-compose run web rails db:migrate
```

## todo

- 管理者権限のみ書籍編集できるようにする
- 多言語化
- 画像登録
- 貸出、返却日を登録して通知まで
- 予約機能
- redisなどキャッシュ系
- esなど全文検索エンジンを使った書籍検索
- aws lambdaなど利用してサムネイルも同時生成

web
http://localhost:3000

mail
http://localhost:1080

## 参考

### rbenvでruby versionを変えてもbundle installできない

Gemfile.lock を削除

### CircleCI のbundler version

https://discuss.circleci.com/t/using-bundler-2-0-during-ci-fails/27411/2