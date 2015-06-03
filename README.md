# 最大値を持つレコードを抽出する方法の比較

- テーブルに100万レコードを登録して比較

見本
```
+----+--------+--------+---+
| id | name   | team   | pt|
+----+--------+--------+---+
|0001|  maboze|    blue| 52|
+----+--------+--------+---+
|0002|  batahi|   green| 68|
+----+--------+--------+---+
|0003|   nopia|  orange| 85|
+----+--------+--------+---+
|0004|  dohenu|    blue| 37|
+----+--------+--------+---+
|0005|  pakuhe|     red| 78|
+----+--------+--------+---+
|0006|  bisopo|  yellow| 13|
+----+--------+--------+---+
|0007|  bozabu|    gray| 88|
+----+--------+--------+---+
|0008|  sinara|     red| 51|
+----+--------+--------+---+
|0009|  dehuma|   white| 50|
+----+--------+--------+---+
```

- 3方式で比較

> `psql.sublime-build`を使用すると、再試行が`ctrl+b`でできるので楽
> ただし、標準エラーが出力されないので、何か設定が必要（あとで調べる）

## 事前準備
ドットインストールでPostgreSQLのチュートリアル済
db:blogapp, table:users作成済

## ダミーデータ100万件作成
- `> ruby generate_dummy_data.rb`
- `> psql blogapp`
- `$ \copy blogapp (name,score,team) from 'data.csv' with csv;`

[CSVファイルをデータベースにインポートする](http://qiita.com/egg_chicken/items/cec72bda3759f875285f)

## 実行計画の取得
`psql -f command.sql -o result.txt`

> sublime textでresult.txtを開いていると更新があった場合自動で開きなおすのでトライ＆エラーをするときに便利

## 実行計画の見方

[PostgreSQLのチューニング技法](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&cad=rja&uact=8&ved=0CCIQFjAB&url=https%3A%2F%2Fwww.postgresql.jp%2Fevents%2Fpgcon09j%2Fdoc%2Fb2-3.pdf&ei=R5NEVdu0HobpmAXy7YHAAw&usg=AFQjCNGvs31wvLjRElw1QdGWrIwVKarwWg&sig2=riLfZ0Wz0pFhfPlsdxhKAQ&bvm=bv.92291466,d.dGY)
[PostgreSQLクエリ実行の基礎知識 ～Explainを読み解こう～](http://www.slideshare.net/MikiShimogai/postgre-sql-explain)
