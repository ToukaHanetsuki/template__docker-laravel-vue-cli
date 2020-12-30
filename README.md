# template__docker-laravel-vue-cli

## 概要
dockerを用いてlaravelとvue-cliを動かすための環境リポジトリ

| 項目 | バージョン |
| --- | --- |
| Laravel | 6.20.8 |
| @vue/cli | 4.5.9 |
| vue | 2.6.11 |
| MySQL | 5.7.31 |

## Set Up

### Backend

#### コンテナの作成・起動
```bash
$ docker-compose up -d --build
```

| オプション | 説明 |
| --- | --- |
| -d | バックグラウンドで実行 |
| --build | 変更点があればビルド、なければキャッシュを利用する |

#### コンテナへ入る
```bash
$ docker-compose exec app bash
```

#### .envの用意
```bash
# コンテナ内で実施
$ cp .env.example .env
$ php artisan key:generate # APP_KEYの作成
```

#### vendorをインストール
```bash
# コンテナ内で実施
$ composer install
```

#### migrationの実施
```bash
# コンテナ内で実施
$ php artisan migrate
```

### Frontend

#### フロントエンドの作業ディレクトリへの移動
```bash
$ cd frontend
```

#### node_modulesのインストール
```bash
$ yarn install
```

#### dev serverの起動
```bash
$ yarn serve
```

#### productionコンパイル
```bash
$ yarn build
```

## Command

### mysqlへの接続
```bash
$ docker-compose exec db bash -c 'mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE}'
```