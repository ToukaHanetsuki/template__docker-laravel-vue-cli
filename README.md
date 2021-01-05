# docker Laravel + vue-cli

## 概要
dockerを用いてlaravelとvue-cliを動かすための環境リポジトリ

| 項目 | バージョン |
| --- | --- |
| Laravel | 6.20.8 |
| node | 12.8.0 |
| npm | 6.14.10 |
| yarn | 1.22.5 |
| @vue/cli | 4.5.9 |
| vue | 2.6.11 |
| typescript | 4.1.3 |
| MySQL | 5.7.31 |

## Set Up
### All set up
```bash
$ make setup
```

### server

#### コンテナの作成・起動
```bash
$ make up
```

#### コンテナへ入る
```bash
$ make bash
```

#### vendorのインストール
```bash
$ make server/install
```

#### マイグレーションの実施
```bash
$ make server/migrate
```

### web

#### node_modulesのインストール
```bash
# ./web/で実施
$ yarn install
```

#### dev serverの起動
```bash
# ./web/で実施
$ yarn serve
```

#### productionコンパイル
```bash
# ./web/で実施
$ yarn build
```

## Commands

### mysqlへの接続
```bash
$ docker-compose exec db bash -c 'mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE}'
```
